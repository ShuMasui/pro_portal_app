import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ここから Featureごとのルート情報を取得していく
import 'package:proportal_app/feature/home_screen/home_branch.dart';
import 'package:proportal_app/feature/side_navigation_bar/presentation/side_navigation_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouterのProvider
/// 内部でrefを使用するためにProviderでProviderScope内で利用している
/// GoRouterの状態を管理し、redirect機能を正常に動作させる
/// ```dart
/// ref.watch(routeProvider);
/// ```
final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            SideNavigationBar(statefulNavigationShell: navigationShell),
        branches: [homeBranch],
      ),
    ],

    redirect: (context, state) => null,
  );
});
