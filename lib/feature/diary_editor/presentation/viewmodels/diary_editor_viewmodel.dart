import 'package:proportal_app/feature/diary_editor/types/diary_editor_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proportal_app/feature/auth/auth.dart';
import 'package:proportal_app/feature/diary/diary.dart';

part 'diary_editor_viewmodel.g.dart';

@riverpod
class DiaryEditorViewmodel extends _$DiaryEditorViewmodel {
  @override
  FutureOr<DiaryEditorState> build() async {
    late final DiaryEditorState tmpState;

    final appUser = ref.read(authProvider).getCurrentUser();
    if (appUser == null) {
      throw Exception('ログイン済みではないユーザーがDiayrEditorにアクセスしています');
    } else {
      final hasPosted = await ref
          .read(diaryProvider)
          .checkTodayDiary(user: appUser);
      tmpState = hasPosted
          ? DiaryEditorState.completed()
          : DiaryEditorState.init();
    }

    return tmpState;
  }

  Future<void> saveDiary({
    required String diaryBody,
    required diaryTitle,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final AppUser? user = ref.watch(authProvider).getCurrentUser();
      if (user == null) {
        throw Exception();
      }

      final uid = user.id;
      final title = diaryTitle;
      final body = diaryBody;

      final Diary diary = Diary(
        userId: uid,
        title: title,
        body: body,
        isPrivate: false,
        tags: ['totoro'],
      );

      await ref.read(diaryProvider).registDiary(diary: diary);

      return DiaryEditorState.completed();
    });
  }

  Future<void> handleErrorDialogSubmit() async {
    state = AsyncData(DiaryEditorState.init());
  }
}
