import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/data/repositories/mock_membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/usecases/get_membership_usecase.dart';

final membershipRepositoryProvider = Provider<MembershipRepository>((ref) {
  return MockMembershipRepository();
});

final getMembershipUseCaseProvider = Provider<GetMembershipUseCase>((ref) {
  final repository = ref.watch(membershipRepositoryProvider);
  return GetMembershipUseCase(repository);
});

final membershipFutureProvider = FutureProvider<Membership>((ref) {
  final useCase = ref.watch(getMembershipUseCaseProvider);
  return useCase.execute();
});
