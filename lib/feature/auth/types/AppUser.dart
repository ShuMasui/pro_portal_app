import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppUser.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String name,
    required DateTime signinAt,
  }) = _AppUser;
}
