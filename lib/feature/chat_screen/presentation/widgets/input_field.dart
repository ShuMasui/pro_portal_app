import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/chat_viewmodel.dart';

/// チャットの入力フィールド
class InputField extends ConsumerStatefulWidget {
  const InputField({super.key, required TextEditingController controller})
    : _controller = controller;

  final TextEditingController _controller;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<InputField> {
  // 入力中の文章に改行が含まれている場合は入力欄を拡大する
  bool isExtended = false;
  // 送信ボタンの無効化
  bool isSendButtonDisabled = false;

  @override
  void initState() {
    super.initState();

    isExtended = false;
    isSendButtonDisabled = false;
  }

  Future<void> handleSendButton() async {
    final message = widget._controller.text;

    setState(() {
      isSendButtonDisabled = true;
    });

    await ref.watch(chatViewmodelProvider.notifier).sendMessage(message);

    widget._controller.clear();

    setState(() {
      isExtended = false;
      isSendButtonDisabled = false;
    });
  }

  Future<void> handleQuoteButton() async {
    setState(() {
      isSendButtonDisabled = true;
    });

    await ref.watch(chatViewmodelProvider.notifier).fetchQuote();

    setState(() {
      isSendButtonDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final center = Container(
      height: isExtended ? 150 : 50,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: TextField(
        style: TextStyle(fontSize: 18, height: 1.3),
        maxLines: 5,
        decoration: InputDecoration(border: InputBorder.none),
        controller: widget._controller,
        onChanged: (value) {
          if (value.contains('\n')) {
            // 改行を含んでいる場合
            setState(() {
              // 伸ばす
              isExtended = true;
            });
          } else {
            setState(() {
              // 伸ばさない
              isExtended = false;
            });
          }
        },
      ),
    );

    final right = SizedBox(
      height: 50,
      child: IconButton(
        onPressed: isSendButtonDisabled ? null : () => handleSendButton(),
        icon: Icon(Icons.send_outlined),
      ),
    );

    final top = ElevatedButton(
      onPressed: isSendButtonDisabled ? null : () => handleQuoteButton(),
      child: SizedBox(width: 100, child: Center(child: Text('名言ボタン'))),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.only(left: 30, bottom: 20),
          child: top,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: center),
            Padding(padding: const EdgeInsets.only(left: 10), child: right),
          ],
        ),
      ],
    );
  }
}
