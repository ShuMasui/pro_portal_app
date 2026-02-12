import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/blinded_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/default_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/diary_tab.dart';
import 'package:proportal_app/feature/diary_editor/presentation/viewmodels/diary_editor_viewmodels.dart';

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

    // 現在の状況をFetchしてViewmodelsの状態を更新
    ref.read(diaryEditorViemodelsProvider.notifier).fetchCurrentPeriodStatsu();
  }

  @override
  void dispose() {
    _editController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  Future<void> onTapSaveButtonHandler(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    /// 日記モードを可否を決定

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiaryTab(),
        SizedBox(height: 10),
        Expanded(
          child: !ref.watch(diaryEditorViemodelsProvider).isLoading
              ? BlindedDiaryEditor()
              : DefaultDiaryEditor(
                  editController: _editController,
                  titleController: _titleController,
                  onTapSaveButtonHandler: () => onTapSaveButtonHandler(context),
                ),
        ),
      ],
    );

    return body;
  }
}
