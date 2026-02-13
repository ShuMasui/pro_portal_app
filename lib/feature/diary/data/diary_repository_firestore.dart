import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proportal_app/feature/auth/auth.dart';
import 'package:proportal_app/feature/diary/types/diary.dart';

import '../domain/diary_repository.dart';

class DiaryRepositoryFirestore extends DiaryRepository {
  final FirebaseFirestore _firebaseFirestoreInstance;

  DiaryRepositoryFirestore({
    required FirebaseFirestore firebaseFirestoreInstance,
  }) : _firebaseFirestoreInstance = firebaseFirestoreInstance;

  static const String collection = 'diaryData';

  /// ドキュメントIDを生成します
  ///
  /// ルール
  ///
  /// 04:00 ~ 28:00までの時間を1日とします
  ///
  /// 例1: 2025/01/01 04:00 -> {uid}-2025-01-01
  ///
  /// 例2: 2025/01/01 03:59 -> {uid}-2024-12-31
  ///
  /// 例3: 2025/01/02 03:59 -> {uid}-2025-01-01
  static String _getDiaryId({required String uid, required DateTime now}) {
    final offsetm4h = now.add(Duration(hours: -4));

    return '$uid-${offsetm4h.toString().substring(0, 10)}';
  }

  @override
  Future<List<Diary>> getDiary({int topN = 0}) {
    // TODO: implement getDiary
    throw UnimplementedError();
  }

  @override
  Future<Diary> getDiaryRandom() {
    // TODO: implement getDiaryRandom
    throw UnimplementedError();
  }

  @override
  Future<void> registDiary({required Diary diary}) async {
    if (validateDiary(diary)) {
      // 正常な日記登録になっているかチェック
      try {
        /*
        新しいドキュメントを引数なしで生成すると、自動的にIDが割り振られる
        自動的にIDが割り振られたドキュメントとの参照を持って、IDを後で使いまわす
        */
        final newDocRef = _firebaseFirestoreInstance
            .collection(collection)
            .doc(_getDiaryId(uid: diary.userId, now: DateTime.now()));

        /*
        保存時の時間を使って登録している
        */
        final diaryJson = diary
            .copyWith(
              id: newDocRef.id,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            )
            .toJson();

        await _firebaseFirestoreInstance
            .collection(collection)
            .doc(newDocRef.id)
            .set(diaryJson);
      } on FirebaseException {
        throw FirebaseException(
          plugin: 'DiaryRepositoryFirestore.registDiaryでFirestoreエラーが発生しています',
        );
      } catch (e) {
        throw Exception('DiaryRepositoryFirestore.registDiaryで予期せぬエラーが発生しています');
      }
    } else {
      throw Exception(
        'DiaryRepositoryFirestore.registDiaryでDiaryの引数エラーが発生しています',
      );
    }
  }

  @override
  Future<bool> checkTodayDiary({required AppUser user}) async {
    final docRef = await _firebaseFirestoreInstance
        .collection(collection)
        .doc(_getDiaryId(uid: user.id, now: DateTime.now()))
        .get();

    return docRef.exists;
  }
}
