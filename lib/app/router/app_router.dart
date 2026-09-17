import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vtqp_flutter_gym_sample/app/router/route_paths.dart';
import 'package:vtqp_flutter_gym_sample/features/home/presentation/pages/starter_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.starter,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.starter,
        builder: (context, state) => const StarterPage(),
      ),
    ],
  );
});
