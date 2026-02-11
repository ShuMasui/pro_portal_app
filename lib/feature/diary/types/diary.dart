import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
abstract class Diary with _$Diary {
  const factory Diary({
    String? id,
    required String userId,
    required String title,
    required String body,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    required bool isPrivate,
    required List<String> tags,
  }) = _Diary;

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

bool Function(Diary) validateDiary = (Diary diary) {
  return diary.userId.isNotEmpty &&
      diary.userId.isNotEmpty &&
      diary.body.isNotEmpty &&
      diary.title.isNotEmpty;
};
