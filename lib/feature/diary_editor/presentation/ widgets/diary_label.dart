import 'package:flutter/material.dart';

class DiaryLabel extends StatelessWidget {
  const DiaryLabel({super.key, required String label}) : _label = label;

  final String _label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      alignment: AlignmentGeometry.centerLeft,
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        ),
      ),
    );
  }
}
