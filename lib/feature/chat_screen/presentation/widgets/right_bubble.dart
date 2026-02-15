import 'package:flutter/material.dart';

/// Chat画面の右側のバブル
class RightBubble extends StatelessWidget {
  final String message;

  const RightBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.4 * 0.8,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 18,
                height: 1.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
