import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/blinded_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/default_diary_editor.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/diary_tab.dart';
import 'package:proportal_app/feature/diary_editor/presentation/viewmodels/diary_editor_viewmodel.dart';

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

  Future<void> onTapSaveButtonHandler(BuildContext context) async {
    await ref
        .read(diaryEditorViewmodelProvider.notifier)
        .saveDiary(
          diaryBody: _editController.getText(),
          diaryTitle: _titleController.text,
        );
  }

  Future<void> showDiaryErrorDialog(BuildContext context) async {
    debugPrint('totoro');
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('タイトルと本文を両方書いてください'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(diaryEditorViewmodelProvider.notifier)
                      .handleErrorDialogSubmit();
                  context.pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(diaryEditorViewmodelProvider, (_, next) {
      next.when(
        data: (_) {},
        error: (_, _) {
          showDiaryErrorDialog(context);
        },
        loading: () {},
      );
    });

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiaryTab(),
        SizedBox(height: 10),
        Expanded(
          child: ref
              .watch(diaryEditorViewmodelProvider)
              .maybeWhen(
                data: (state) {
                  return state.isCompleted
                      ? BlindedDiaryEditor()
                      : DefaultDiaryEditor(
                          editController: _editController,
                          titleController: _titleController,
                          onTapSaveButtonHandler: () =>
                              onTapSaveButtonHandler(context),
                        );
                },
                orElse: () => SizedBox.expand(),
              ),
        ),
      ],
    );

    return body;
  }
}
