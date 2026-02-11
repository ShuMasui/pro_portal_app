import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:proportal_app/feature/diary_editor/diary_editor.dart';

class LeftBody extends ConsumerWidget {
  const LeftBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DiaryEditor();
  }
}
