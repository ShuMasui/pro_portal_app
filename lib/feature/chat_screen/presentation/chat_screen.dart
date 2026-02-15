import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/chat_screen/data/quote_repository_meigen.dart';
import 'package:proportal_app/feature/chat_screen/domain/quote_repository.dart';
import 'package:proportal_app/feature/chat_screen/presentation/viewmodels/chat_viewmodel.dart';

import './widgets/widgets.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // チャット開始前の状態をセット
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = ref
        .watch(chatViewmodelProvider)
        .maybeWhen(
          orElse: () {
            return Placeholder();
          },
          data: (data) {
            return Column(
              children: [
                Expanded(
                  child: data.isInit
                      ? const ChatInitialList()
                      : const ChatScreenList(),
                ),
                InputField(controller: _controller),
              ],
            );
          },
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: body,
    );
  }
}

void main() {
  runApp(
    ProviderScope(
      overrides: [
        quoteProvider.overrideWithValue(QuoteRepositoryMeigen(dio: Dio())),
      ],
      child: const MaterialApp(home: Scaffold(body: ChatScreen())),
    ),
  );
}
