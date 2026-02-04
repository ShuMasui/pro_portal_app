import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/home_screen/presentation/home_screen.dart';
import 'package:proportal_app/feature/home_screen/domain/info_route.dart';

final StatefulShellBranch homeBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: HomeRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
