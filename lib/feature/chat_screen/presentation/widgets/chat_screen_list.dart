import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/chat_data.dart';
import '../viewmodels/chat_list.dart';
import './left_bubble.dart';
import './right_bubble.dart';

/// チャットのバブル表示画面
class ChatScreenList extends ConsumerWidget {
  const ChatScreenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final body = ListView.builder(
      itemCount: ref.watch(chatListProvider).length,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        final id = ref.watch(chatListProvider)[index];

        final chat = ref.watch(chatDataProvider(id));

        final bubble = chat.isUser
            ? RightBubble(message: chat.message)
            : LeftBubble(message: chat.message);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: bubble,
        );
      },
    );

    return body;
  }
}
