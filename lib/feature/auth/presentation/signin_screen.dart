import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/auth/presentation/widgets/siginin_button.dart';
import 'package:proportal_app/feature/auth/presentation/widgets/signin_email_field.dart';
import 'package:proportal_app/feature/auth/presentation/widgets/signin_pass_field.dart';
import 'package:proportal_app/feature/auth/presentation/widgets/signin_textfield_title.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passController = TextEditingController();
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
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
    );

    final TextStyle passStyle = TextStyle(
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
              SigninTextfieldTitle(text: 'メールアドレス', style: textStyle),
              SizedBox(height: 5),
              SigninEmailField(
                credentialBoxDecoration: credentialBoxDecoration,
                controller: _emailController,
                style: passStyle,
              ),
              SizedBox(height: 50),
              SigninTextfieldTitle(text: 'パスワード', style: textStyle),
              SizedBox(height: 5),
              SigninPassField(
                credentialBoxDecoration: credentialBoxDecoration,
                controller: _passController,
                style: passStyle,
              ),
              SizedBox(height: 50),
              SigininButton(
                emailController: _emailController,
                passController: _passController,
                textStyle: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(body: body);
  }
}
