import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proportal_app/firebase_options.dart';
import 'package:proportal_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const App()));
}
