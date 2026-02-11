import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proportal_app/feature/diary/types/diary.dart';

import '../domain/diary_repository.dart';
import 'package:proportal_app/feature/auth/auth.dart';

class DiaryRepositoryFirestore extends DiaryRepository {
  final FirebaseFirestore firebaseFirestoreInstance;

  DiaryRepositoryFirestore({required this.firebaseFirestoreInstance});

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
        final newDocRef = firebaseFirestoreInstance
            .collection('diaryData')
            .doc();

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

        await firebaseFirestoreInstance
            .collection('diaryData')
            .doc(newDocRef.id)
            .set(diaryJson);
      } on FirebaseException catch (e) {
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
}
