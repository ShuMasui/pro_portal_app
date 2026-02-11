import '../types/diary.dart';

abstract class DiaryRepository {
  /// 日記を入手します
  ///
  /// [ topN ] 最新の日記の取得個数です
  Future<List<Diary>> getDiary({int topN});

  /// 存在する日記のうち、ランダムに日記を入手します
  Future<Diary> getDiaryRandom();

  /// 日記を登録します
  ///
  /// [ diary ]　登録したい日記の種別です
  Future<void> registDiary({required Diary diary});
}
