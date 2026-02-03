import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/home_screen/presentation/home_screen.dart';

final StatefulShellBranch homeBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
