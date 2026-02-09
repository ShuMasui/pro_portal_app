import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/home_screen/presentation/home_screen.dart';
import 'package:proportal_app/feature/home_screen/data/info_route.dart';

final StatefulShellBranch homeBranch = StatefulShellBranch(
  initialLocation: HomeRoutes.homeScreen,
  routes: [
    GoRoute(
      path: HomeRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
