import 'package:proportal_app/feature/auth/types/AppUser.dart';

import '../domain/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryFirebase extends AuthRepository<User> {
  final FirebaseAuth firebaseAuthInstance;

  AuthRepositoryFirebase({required this.firebaseAuthInstance});

  @override
  Future<void> signIn({required String email, required String pass}) async {
    /// FirebaseAuthのインスタンスはシングルトンなので、直接取得してOK
    await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthInstance.signOut();
  }

  @override
  Future<void> createUser({required String email, required String pass}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Stream<User?> authStateChanges() {
    return firebaseAuthInstance.authStateChanges();
  }

  @override
  AppUser? getCurrentUser() {
    final User? tmp = firebaseAuthInstance.currentUser;

    late final AppUser appUser;
    if (tmp != null) {
      appUser = AppUser(
        id: tmp.uid,
        email: tmp.email ?? '',
        name: tmp.displayName ?? '',
        signinAt: DateTime.now(),
      );
      return appUser;
    } else {
      return null;
    }
  }
}
