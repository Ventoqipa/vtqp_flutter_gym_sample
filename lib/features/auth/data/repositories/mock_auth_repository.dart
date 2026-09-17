import 'package:vtqp_flutter_gym_sample/features/auth/data/datasources/mock_auth_data_source.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/domain/entities/user.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  const MockAuthRepository(this._dataSource);

  final MockAuthDataSource _dataSource;

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final raw = await _dataSource.login(email: email, password: password);

    return User(
      id: raw['id']!,
      name: raw['name']!,
      email: raw['email']!,
    );
  }
}
