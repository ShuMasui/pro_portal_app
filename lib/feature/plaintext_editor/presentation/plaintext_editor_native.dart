import 'package:flutter/material.dart';
import '../domain/edit_controller.dart';

/// This is the PlainTextEditor for Native Platforms
///
/// Ex.
/// - Android
/// - iOS
class PlaintextEditor extends StatefulWidget {
  final EditController controller;
  final ValueChanged<int> onChangedLetterCount;

  const PlaintextEditor({
    super.key,
    required this.controller,
    required this.onChangedLetterCount,
  });

  @override
  State<PlaintextEditor> createState() => _PlaintextEditorState();
}

class _PlaintextEditorState extends State<PlaintextEditor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return throw UnimplementedError();
  }
}
