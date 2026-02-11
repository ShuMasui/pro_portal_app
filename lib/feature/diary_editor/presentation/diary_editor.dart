import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:proportal_app/feature/plaintext_editor/plaintext_editor.dart';
import 'package:proportal_app/feature/diary/diary.dart';

class DiaryEditor extends ConsumerStatefulWidget {
  const DiaryEditor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiaryEditorState();
}

class _DiaryEditorState extends ConsumerState<DiaryEditor> {
  late final EditController _editController;
  late int _letterCount;

  @override
  void initState() {
    super.initState();

    _editController = EditController();

    _letterCount = 0;
  }

  @override
  void dispose() {
    _editController.dispose();

    super.dispose();
  }

  Future<void> saveDiary() async {
    try {
      final title = 'sample';

      final body = _editController.getText();

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
      throw Exception(e.toString());
    }

    _editController.clearText();
  }

  @override
  Widget build(BuildContext context) {
    /// 日記モードを可否を決定
    final blindFlag = false;

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.rectangle,
          ),
          height: 30,
          width: 150,
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.library_books_outlined,
                color: Theme.of(context).colorScheme.onInverseSurface,
                size: 15,
              ),
              SizedBox(width: 8),
              Text(
                'Diary Editor',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: blindFlag
              ? Container(child: Text('今日の保存は終了しました！'))
              : Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 80,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(20),
                    border: BoxBorder.all(
                      color: Theme.of(context).colorScheme.secondaryFixed,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 50),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        child: PlaintextEditor(
                          height: 400,
                          width: 450,
                          controller: _editController,
                          onChangedLetterCount: (int count) {
                            setState(() {
                              _letterCount = count;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: saveDiary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 20,
                              ),
                              child: Container(
                                height: 40,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondaryFixed,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSecondaryFixedVariant,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ElevatedButton(onPressed: saveDiary, child: Text('Save')),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );

    return body;
  }
}
