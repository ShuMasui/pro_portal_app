import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/auth_repository.dart';

class AuthViewmodels extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  /// サインインボタンのクリック動作をハンドリングする
  ///
  /// エラーが発生した場合は，stateに登録し，handleSiginErrorをハンドリングする
  Future<void> onClickSigninHandler({
    required String id,
    required String pass,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) async {
    try {
      await ref.watch(authProvider).signIn(email: id, pass: pass);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// 現在のエラー状況に合わせて，エラーハンドリングを行う
  /// siginin画面を対象としている
  ///
  /// 状態変化をNotifierして状態変化を他に通知する
  Future<void> handleSigninError(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passController,
  ) async {
    final error = state.whenData((_) => null).error;
    if (error != null) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('IDかパスワードが間違っています'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  emailController.clear();
                  passController.clear();
                  context.pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

/// ref.(siginScreenViewmodelsProvider)
final authViewmodelsProvider = AsyncNotifierProvider(AuthViewmodels.new);
