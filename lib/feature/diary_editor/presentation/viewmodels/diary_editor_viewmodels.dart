import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/auth/auth.dart';
import 'package:proportal_app/feature/diary/diary.dart';

class DiaryeEditorViewmodels extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
  }

  Future<void> onTapSaveDiaryHandler({
    required String diaryBody,
    required String diaryTitle,
  }) async {}

  Future<void> popUpErrorDialog() async {}

  /// その日のうちに投稿した日記の数を判定する
  ///
  /// 状態更新のための関数
  Future<void> fetchCurrentPeriodStatsu() async {}
}

final diaryEditorViemodelsProvider = AsyncNotifierProvider(
  DiaryeEditorViewmodels.new,
);
