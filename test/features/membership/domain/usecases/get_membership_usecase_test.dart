import 'package:flutter_test/flutter_test.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/usecases/get_membership_usecase.dart';

// Fake Repository que no depende de rootBundle ni del JSON
class FakeMembershipRepository implements MembershipRepository {
  @override
  Future<Membership> getMembership() async {
    return const Membership(
      type: 'Premium',
      status: 'Active',
      expirationDate: '30/09/2026',
    );
  }
}

void main() {
  late GetMembershipUseCase useCase;
  late FakeMembershipRepository fakeRepository;

  setUp(() {
    fakeRepository = FakeMembershipRepository();
    useCase = GetMembershipUseCase(fakeRepository);
  });

  test('GetMembershipUseCase returns valid membership data', () async {
    final result = await useCase.execute();

    expect(result, isA<Membership>());
    expect(result.type, equals('Premium'));
    expect(result.status, equals('Active'));
  });
}
