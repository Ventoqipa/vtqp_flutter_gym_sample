import 'package:vtqp_flutter_gym_sample/features/access_history/domain/entities/access_record.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/domain/repositories/access_history_repository.dart';

class GetAccessHistoryUseCase {
  GetAccessHistoryUseCase(this.repository);

  final AccessHistoryRepository repository;

  Future<List<AccessRecord>> execute() {
    return repository.getAccessHistory();
  }
}
