import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/blinded_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/default_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/diary_tab.dart';
import 'package:proportal_app/feature/diary_editor/presentation/viewmodels/diaryEditorViewmodels.dart';

import 'package:proportal_app/feature/plaintext_editor/plaintext_editor.dart';

class DiaryEditor extends ConsumerStatefulWidget {
  const DiaryEditor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiaryEditorState();
}

class _DiaryEditorState extends ConsumerState<DiaryEditor> {
  late final EditController _editController;
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();

    _editController = EditController();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _editController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  Future<void> onTapSaveButtonHandler() async {
    await ref
        .watch(diaryEditorViemodelsProvider.notifier)
        .onTapSaveDiaryHandler(
          diaryBody: _editController.getText(),
          diaryTitle: _titleController.text,
        );

    _editController.clearText();
    _titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    /// 日記モードを可否を決定
    final blindFlag = false;

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiaryTab(),
        SizedBox(height: 10),
        Expanded(
          child: blindFlag
              ? BlindedDiaryEditor()
              : DefaultDiaryEditor(
                  editController: _editController,
                  titleController: _titleController,
                  onTapSaveButtonHandler: onTapSaveButtonHandler,
                ),
        ),
      ],
    );

    return body;
  }
}
