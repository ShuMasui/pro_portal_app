import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/diary/types/diary.dart';
import 'package:proportal_app/feature/plaintext_editor/plaintext_editor.dart';

class DiaryeEditorViewmodels extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> onTapSaveDiaryHandler({
    required String diaryBody,
    required String diaryTitle,
  }) async {
    try {
      final title = diaryTitle;

      final body = diaryBody;

      final userId = '0000';

      final isPrivate = false;

      final tags = ['totoro'];

      final Diary diary = Diary(
        userId: userId,
        title: title,
        body: body,
        isPrivate: isPrivate,
        tags: tags,
      );

      debugPrint(diary.toJson().toString());
      // ref.watch(diaryProvider).registDiary(diary: diary);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final diaryEditorViemodelsProvider = AsyncNotifierProvider(
  DiaryeEditorViewmodels.new,
);
