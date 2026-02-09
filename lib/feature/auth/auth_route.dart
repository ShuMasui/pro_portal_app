import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/auth/presentation/signin_screen.dart';
import 'package:proportal_app/feature/auth/data/info_route.dart';

final List<GoRoute> authRoute = [
  // 0番目にはベースの画面を設定
  GoRoute(
    path: InfoRoute.path,
    builder: (context, state) => const SigninScreen(),
  ),
];
