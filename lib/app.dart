import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proportal_app/core/router/router.dart';

/// アプリケーションの状態管理エントリーポイント
/// アプリ全機能の巻き上げを行う
/// NavigationもこのWidget上で管理する
///
/// ```dart
/// return MaterialApp
/// ```
class App extends ConsumerWidget {
  const App({super.key});

  /// 型安全性のためのラッパークラス
  /// ```dart
  /// return MaterialApp
  /// ```
  MaterialApp buildApp(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routeProvider),
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.notoSansMonoTextTheme(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildApp(context, ref);
  }
}
