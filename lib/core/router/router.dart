import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/auth/auth.dart';

// ここから Featureごとのルート情報を取得していく
import 'package:proportal_app/feature/auth/auth_route.dart';
import 'package:proportal_app/feature/home_screen/home_branch.dart';
import 'package:proportal_app/feature/side_navigation_bar/side_navigation_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouterのProvider
/// 内部でrefを使用するためにProviderでProviderScope内で利用している
/// GoRouterの状態を管理し、redirect機能を正常に動作させる
/// ```dart
/// ref.watch(routeProvider);
/// ```
final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: authRoute[0].path,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: _GoRouterRefreshStream(
      ref.watch(authProvider).authStateChanges(),
    ),
    routes: [
      // SigininScreen Route
      ...authRoute,
      // HomeScreen Branchs
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            SideNavigationBar(statefulNavigationShell: navigationShell),
        branches: [homeBranch],
      ),
    ],

    redirect: (context, state) {
      final bool isSignined = ref.watch(authProvider).getCurrentUser() != null;

      final String curerntPath = state.matchedLocation;
      // SignIn系のページにいるのかをマッチで判定
      final bool isSigninPage = authRoute
          .where((r) => r.path == curerntPath)
          .isNotEmpty;

      if (isSignined) {
        if (isSigninPage) {
          return homeBranch.initialLocation;
        } else {
          return curerntPath;
        }
      } else {
        return authRoute[0].path;
      }
    },
  );
});

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
