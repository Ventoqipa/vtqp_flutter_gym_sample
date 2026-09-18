import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vtqp_flutter_gym_sample/app/router/route_paths.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/presentation/pages/access_history_page.dart';
import 'package:vtqp_flutter_gym_sample/features/home/presentation/pages/starter_page.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/presentation/pages/membership_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation:
        RoutePaths.starter, // Devuélvelo a la ruta inicial original
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.starter,
        builder: (context, state) => const StarterPage(),
      ),
      GoRoute(
        path: '/membership',
        builder: (context, state) => const MembershipPage(),
      ),
      GoRoute(
        path: '/access-history',
        builder: (context, state) => const AccessHistoryPage(),
      ),
    ],
  );
});
