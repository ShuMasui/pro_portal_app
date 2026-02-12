import 'package:flutter/material.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/diary_label.dart';
import 'package:proportal_app/feature/diary_editor/presentation/%20widgets/save_button.dart';
import 'package:proportal_app/feature/plaintext_editor/plaintext_editor.dart';

class DefaultDiaryEditor extends StatelessWidget {
  const DefaultDiaryEditor({
    super.key,
    required EditController editController,
    required TextEditingController titleController,
    required VoidCallback onTapSaveButtonHandler,
  }) : _editController = editController,
       _titleController = titleController,
       _onTapSaveButtonHandler = onTapSaveButtonHandler;

  final EditController _editController;
  final TextEditingController _titleController;
  final VoidCallback _onTapSaveButtonHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(
          color: Theme.of(context).colorScheme.secondaryFixed,
        ),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 50)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DiaryLabel(label: 'タイトル'),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: TextField(
              controller: _titleController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(height: 20),
          DiaryLabel(label: '本文'),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: PlaintextEditor(
              height: 400,
              controller: _editController,
              onChangedLetterCount: (int count) {},
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SaveButton(onTaphandler: _onTapSaveButtonHandler),
              ),
              // ElevatedButton(onPressed: saveDiary, child: Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
