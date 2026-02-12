import 'package:flutter/material.dart';

class SigninTextfieldTitle extends StatelessWidget {
  const SigninTextfieldTitle({
    super.key,
    required this.style,
    required this.text,
  });

  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      alignment: AlignmentGeometry.centerLeft,
      child: Text(text, style: style),
    );
  }
}
