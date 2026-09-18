import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/presentation/providers/access_history_providers.dart';

class AccessHistoryPage extends ConsumerWidget {
  const AccessHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessHistoryAsync = ref.watch(accessHistoryFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Access History'),
      ),
      body: accessHistoryAsync.when(
        data: (records) => ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, index) {
            final record = records[index];
            return ListTile(
              leading: const Icon(Icons.door_sliding),
              title: Text(record.location),
              subtitle: Text('${record.date} at ${record.time}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
