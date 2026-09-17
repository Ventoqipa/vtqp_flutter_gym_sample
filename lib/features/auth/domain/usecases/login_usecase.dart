import 'package:vtqp_flutter_gym_sample/features/auth/domain/entities/user.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/domain/repositories/auth_repository.dart';

/// Represents the application action of authenticating a user.
class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<User> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
