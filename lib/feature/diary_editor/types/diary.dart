import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
abstract class Diary with _$Diary {
  const factory Diary({
    required String id,
    required String title,
    required String body,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isPrivate,
    required List<String> tags,
  }) = _Diary;

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
}
