import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/data/repositories/mock_access_history_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/domain/entities/access_record.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/domain/repositories/access_history_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/access_history/domain/usecases/get_access_history_usecase.dart';

final accessHistoryRepositoryProvider =
    Provider<AccessHistoryRepository>((ref) {
  return MockAccessHistoryRepository();
});

final getAccessHistoryUseCaseProvider =
    Provider<GetAccessHistoryUseCase>((ref) {
  final repository = ref.watch(accessHistoryRepositoryProvider);
  return GetAccessHistoryUseCase(repository);
});

final accessHistoryFutureProvider = FutureProvider<List<AccessRecord>>((ref) {
  final useCase = ref.watch(getAccessHistoryUseCaseProvider);
  return useCase.execute();
});
