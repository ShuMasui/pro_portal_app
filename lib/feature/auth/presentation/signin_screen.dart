import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/auth/domain/auth_repository.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  bool _isObscure = true;

  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passController = TextEditingController();

    _isObscure = true;
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration credentialBoxDecoration = BoxDecoration(
      color: Theme.of(context).colorScheme.onSurface,
      borderRadius: BorderRadius.circular(30),
      border: BoxBorder.all(style: BorderStyle.none),
    );

    final TextStyle textStyle = TextStyle(
      fontFamily: 'monospace',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
    );

    final TextStyle passStyle = TextStyle(
      fontFamily: 'monospace',
      fontSize: 20,
      height: 1.3,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onInverseSurface,
      letterSpacing: 2,
      textBaseline: TextBaseline.ideographic,
    );

    final body = Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
          // height: 400,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                Colors.grey.shade300, //Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: Offset.zero,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: AlignmentGeometry.center,
                child: Text(
                  'ProPortal ログイン',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: AlignmentGeometry.centerLeft,
                child: Text('メールアドレス', style: textStyle),
              ),
              SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                decoration: credentialBoxDecoration,
                width: 300,
                height: 45,
                child: TextField(
                  controller: _emailController,
                  cursorHeight: textStyle.fontSize! * 0.8,
                  maxLines: 1,
                  decoration: InputDecoration(border: InputBorder.none),
                  style: passStyle,
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: AlignmentGeometry.centerLeft,
                child: Text('パスワード', style: textStyle),
              ),
              SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                decoration: credentialBoxDecoration,
                width: 300,
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passController,
                        cursorHeight: textStyle.fontSize! * 0.8,
                        maxLines: 1,
                        decoration: InputDecoration(border: InputBorder.none),
                        style: passStyle,
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
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await ref
                          .watch(authProvider)
                          .signIn(
                            email: _emailController.text,
                            pass: _passController.text,
                          );
                    } on FirebaseAuthException {
                      if (mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('IDかパスワードが間違っています'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    _emailController.clear();
                                    _passController.clear();
                                    context.pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    'サインイン',
                    style: textStyle.copyWith(
                      fontSize: textStyle.fontSize! * 0.8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(body: body);
  }
}
