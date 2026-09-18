import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';

abstract class MembershipRepository {
  Future<Membership> getMembership();
}
