import 'package:flutter/material.dart';
import '../domain/edit_controller.dart';

class PlaintextEditor extends StatelessWidget {
  final EditController controller;
  final ValueChanged<int> onChangedLetterCount;

  const PlaintextEditor({
    super.key,
    required this.controller,
    required this.onChangedLetterCount,
  });

  @override
  Widget build(BuildContext context) {
    return throw UnimplementedError(
      'PlaintextEditor is not implemented for this platform.',
    );
  }
}
