import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proportal_app/firebase_options.dart';
import 'package:proportal_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final scope = ProviderScope(
    /// DI
    overrides: [
      authProvider.overrideWithValue(
        AuthRepositoryFirebase(firebaseAuthInstance: FirebaseAuth.instance),
      ),
    ],
    child: const App(),
  );

  runApp(scope);
}
