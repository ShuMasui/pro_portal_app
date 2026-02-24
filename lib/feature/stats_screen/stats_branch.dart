import 'package:go_router/go_router.dart';
import './data/info_route.dart';
import './presentation/stats_screen.dart';

final StatefulShellBranch statsBranch = StatefulShellBranch(
  initialLocation: StatsRoute.routeName,
  routes: [
    GoRoute(
      path: StatsRoute.routeName,
      builder: (context, state) => const StatsScreen(),
    ),
  ],
);
