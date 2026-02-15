import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 175,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.chat_bubble_outlined,
            color: Theme.of(context).colorScheme.onInverseSurface,
            size: 15,
          ),
          SizedBox(width: 8),
          Text(
            'Personal AI Chat',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
