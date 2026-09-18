import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vtqp_flutter_gym_sample/app/router/route_paths.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/presentation/pages/login_page.dart';
import 'package:vtqp_flutter_gym_sample/features/home/presentation/pages/home_page.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/presentation/pages/membership_page.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/presentation/pages/access_history_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.login,
    routes: [
      GoRoute(
        path: RoutePaths.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutePaths.membership,
        name: 'membership',
        builder: (context, state) => const MembershipPage(),
      ),
      GoRoute(
        path: RoutePaths.history,
        name: 'history',
        builder: (context, state) => const AccessHistoryPage(),
      ),
    ],
  );
});
