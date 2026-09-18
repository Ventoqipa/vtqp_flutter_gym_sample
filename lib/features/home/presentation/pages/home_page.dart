import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vtqp_flutter_gym_sample/features/auth/presentation/providers/login_provider.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/presentation/providers/login_state.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/presentation/providers/membership_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);
    final greetingName = switch (loginState) {
      LoginSuccess(:final user) => user.name,
      _ => 'there',
    };

    final membershipAsync = ref.watch(membershipFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $greetingName!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('Welcome back to VTQP Gym.'),
            const SizedBox(height: 24),
            _MembershipSummaryCard(membershipAsync: membershipAsync),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.goNamed('membership'),
              icon: const Icon(Icons.card_membership),
              label: const Text('View membership'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => context.goNamed('history'),
              icon: const Icon(Icons.history),
              label: const Text('View access history'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MembershipSummaryCard extends StatelessWidget {
  const _MembershipSummaryCard({required this.membershipAsync});

  final AsyncValue<Membership> membershipAsync;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: membershipAsync.when(
          data: (membership) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                membership.type,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text('Status: ${membership.status}'),
            ],
          ),
          loading: () => const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (_, __) => const Text('Unable to load membership.'),
        ),
      ),
    );
  }
}
