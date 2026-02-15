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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatTab(),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(20),
                      border: BoxBorder.all(
                        color: Theme.of(context).colorScheme.secondaryFixed,
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, blurRadius: 50),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 40,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: data.isInit
                              ? const ChatInitialList()
                              : const ChatScreenList(),
                        ),
                        SizedBox(height: 10),
                        InputField(controller: _controller),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );

    return body;
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
