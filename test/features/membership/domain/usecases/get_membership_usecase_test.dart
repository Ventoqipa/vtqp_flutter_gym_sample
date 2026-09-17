import 'package:flutter_test/flutter_test.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/data/repositories/mock_membership_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/usecases/get_membership_usecase.dart';

void main() {
  test('GetMembershipUseCase returns valid membership data', () async {
    // Arrange
    final repository = MockMembershipRepository();
    final useCase = GetMembershipUseCase(repository);

    // Act
    final result = await useCase.execute();

    // Assert
    expect(result.type, equals('Premium'));
    expect(result.status, equals('Active'));
  });
}
