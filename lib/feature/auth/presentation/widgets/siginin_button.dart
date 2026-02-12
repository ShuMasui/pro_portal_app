import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/auth/presentation/viewmodels/auth_viewmodels.dart';

/// SiginButton
///
/// [emailController]と[passController]は値の取得に利用します
///
/// テキストスタイルは万んかあのボタンのスタイルとして利用します
class SigininButton extends ConsumerWidget {
  const SigininButton({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passController,
    required this.textStyle,
  }) : _emailController = emailController,
       _passController = passController;

  final TextEditingController _emailController;
  final TextEditingController _passController;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          /*
          サインイン処理をNotifier経由で行う
          */
          await ref
              .watch(authViewmodelsProvider.notifier)
              .onClickSigninHandler(
                id: _emailController.text,
                pass: _passController.text,
                emailController: _emailController,
                passController: _passController,
              );

          /* 
          コンテキスト状態を確認し，正常な実行終了を保証
          呼び出し終了後のwindowに対してDialogを表示しないようにする
           */
          if (context.mounted) {
            await ref
                .watch(authViewmodelsProvider.notifier)
                .handleSigninError(context, _emailController, _passController);
          }
        },
        child: Text(
          'サインイン',
          style: textStyle.copyWith(fontSize: textStyle.fontSize! * 0.8),
        ),
      ),
    );
  }
}
