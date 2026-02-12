import 'package:flutter/material.dart';

class SigninEmailField extends StatelessWidget {
  const SigninEmailField({
    super.key,
    required this.credentialBoxDecoration,
    required TextEditingController controller,
    required this.style,
  }) : _controller = controller;

  final BoxDecoration credentialBoxDecoration;
  final TextEditingController _controller;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: credentialBoxDecoration,
      width: 300,
      height: 45,
      child: TextField(
        controller: _controller,
        cursorHeight: style.fontSize! * 0.8,
        maxLines: 1,
        decoration: InputDecoration(border: InputBorder.none),
        style: style,
      ),
    );
  }
}
