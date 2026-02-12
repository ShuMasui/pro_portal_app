import 'package:flutter/material.dart';

class DiaryTab extends StatelessWidget {
  const DiaryTab({super.key});

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
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
