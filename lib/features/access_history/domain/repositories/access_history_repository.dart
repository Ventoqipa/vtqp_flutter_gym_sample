import 'package:vtqp_flutter_gym_sample/features/access_history/domain/entities/access_record.dart';

abstract class AccessHistoryRepository {
  Future<List<AccessRecord>> getAccessHistory();
}
