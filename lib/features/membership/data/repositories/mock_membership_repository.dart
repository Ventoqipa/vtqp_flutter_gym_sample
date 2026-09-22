import 'package:vtqp_flutter_gym_sample/features/membership/data/datasources/membership_local_data_source.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';
import 'package:vtqp_flutter_gym_sample/features/membership/domain/repositories/membership_repository.dart';

class MockMembershipRepository implements MembershipRepository {
  MockMembershipRepository({required this.dataSource});

  final MembershipLocalDataSource dataSource;

  @override
  Future<Membership> getMembership() async {
    final model = await dataSource.getMembership();
    return Membership(
      type: model.type,
      status: model.status,
      expirationDate: model.expirationDate,
    );
  }
}
