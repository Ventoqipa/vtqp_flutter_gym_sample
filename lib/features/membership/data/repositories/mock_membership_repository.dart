import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';

class MockMembershipRepository implements MembershipRepository {
  @override
  Future<Membership> getMembership() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return const Membership(
      type: 'Premium',
      status: 'Active',
      expirationDate: '30/09/2026',
    );
  }
}
