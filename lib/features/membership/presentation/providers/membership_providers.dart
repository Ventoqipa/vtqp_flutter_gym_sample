import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/data/datasources/membership_local_data_source.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/data/repositories/mock_membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/usecases/get_membership_usecase.dart';

final membershipDataSourceProvider = Provider<MembershipLocalDataSource>((ref) {
  return MembershipLocalDataSourceImpl();
});

final membershipRepositoryProvider = Provider<MembershipRepository>((ref) {
  final dataSource = ref.watch(membershipDataSourceProvider);
  return MockMembershipRepository(dataSource: dataSource);
});

final getMembershipUseCaseProvider = Provider<GetMembershipUseCase>((ref) {
  final repository = ref.watch(membershipRepositoryProvider);
  return GetMembershipUseCase(repository);
});

final membershipFutureProvider = FutureProvider<Membership>((ref) {
  final useCase = ref.watch(getMembershipUseCaseProvider);
  return useCase.execute();
});
