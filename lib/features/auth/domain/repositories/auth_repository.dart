import 'package:vtqp_flutter_gym_sample/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({
    required String email,
    required String password,
  });
}