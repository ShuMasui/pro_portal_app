import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/auth/types/AppUser.dart';

/// サインイン処理をラップするためのリポジトリクラス
///
/// サインイン処理を```signIn()```で
/// Googleを使ったSSOを```signInWithGoogle()```で
/// サインアウト処理を```signOut()```で
/// 実装すること
abstract class AuthRepository<T> {
  Stream<T?> authStateChanges();

  AppUser? getCurrentUser();

  Future<void> signIn({required String email, required String pass});

  Future<void> signInWithGoogle();

  Future<void> signOut();

  Future<void> createUser({required String email, required String pass});
}

/// AuthRepositoryオブジェクトを共通利用するためのプロバイダーです
///
/// ```
/// ref.watch(authProvider).getCurrentUser();
/// ```
///
/// でサインイン済みユーザーをゲットすることができます。
final authProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError('初期化されていません'),
);
