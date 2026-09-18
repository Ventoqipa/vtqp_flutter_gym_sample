import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';

class GetMembershipUseCase {
  GetMembershipUseCase(this.repository);

  final MembershipRepository repository;

  Future<Membership> execute() {
    return repository.getMembership();
  }
}
