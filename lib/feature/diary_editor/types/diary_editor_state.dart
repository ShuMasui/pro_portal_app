import 'package:flutter/material.dart';

@immutable
class DiaryEditorState {
  final bool isCompleted;

  const DiaryEditorState._({required this.isCompleted});

  factory DiaryEditorState.init() => DiaryEditorState._(isCompleted: false);
  factory DiaryEditorState.completed() => DiaryEditorState._(isCompleted: true);

  DiaryEditorState copyWith(bool? isCompleted) {
    return DiaryEditorState._(isCompleted: isCompleted ?? this.isCompleted);
  }
}
