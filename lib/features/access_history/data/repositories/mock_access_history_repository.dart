import 'package:vtqp_flutter_gym_sample/features/access_history/domain/entities/access_record.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/domain/repositories/access_history_repository.dart';

class MockAccessHistoryRepository implements AccessHistoryRepository {
  @override
  Future<List<AccessRecord>> getAccessHistory() async {
    // Simula una pequeña demora de red
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const [
      AccessRecord(
        id: '1',
        date: '2026-09-15',
        time: '08:30 AM',
        location: 'Main Turnstile',
      ),
      AccessRecord(
        id: '2',
        date: '2026-09-16',
        time: '07:15 AM',
        location: 'Main Turnstile',
      ),
      AccessRecord(
        id: '3',
        date: '2026-09-17',
        time: '06:00 PM',
        location: 'VIP Entrance',
      ),
    ];
  }
}
