import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:proportal_app/feature/chat_screen/chat_screen.dart';

class RightBody extends ConsumerWidget {
  const RightBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ChatScreen();
  }
}
