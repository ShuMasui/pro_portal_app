import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required VoidCallback onTaphandler})
    : _onTaphandler = onTaphandler;

  final VoidCallback _onTaphandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.secondaryFixed,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10.0)],
        ),
        child: ElevatedButton(
          onPressed: _onTaphandler,
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
