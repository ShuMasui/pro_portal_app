import 'package:flutter/material.dart';

class SigninPassField extends StatefulWidget {
  const SigninPassField({
    super.key,
    required this.credentialBoxDecoration,
    required TextEditingController controller,
    required this.style,
  }) : _controller = controller;

  final BoxDecoration credentialBoxDecoration;
  final TextEditingController _controller;
  final TextStyle style;

  @override
  State<SigninPassField> createState() => _SigninPassFieldState();
}

class _SigninPassFieldState extends State<SigninPassField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();

    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: widget.credentialBoxDecoration,
      width: 300,
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget._controller,
              cursorHeight: widget.style.fontSize! * 0.8,
              maxLines: 1,
              decoration: InputDecoration(border: InputBorder.none),
              style: widget.style,
              obscureText: _isObscure,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: Icon(
              _isObscure
                  ? Icons.remove_red_eye_outlined
                  : Icons.no_encryption_rounded,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
