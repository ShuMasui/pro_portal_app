import 'package:flutter/material.dart';

/// チャット画面の左側のバブル
class LeftBubble extends StatelessWidget {
  final String message;

  const LeftBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
        // NOTE: 物体全体の位置を移動させるためにContainerではなくAlignで位置を変更している
        // 画面の左側に寄せる
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.person, size: 35),
            SizedBox(width: 10),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryFixed,
                    fontSize: 20,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                DateTime.now().toString().substring(11, 16),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
