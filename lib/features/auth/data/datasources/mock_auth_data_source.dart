import 'package:vtqp_flutter_gym_sample/features/auth/data/exceptions/auth_exception.dart';

/// Simulated authentication source. Returns raw data,
/// not domain entities — mapping happens in the repository.
class MockAuthDataSource {
  const MockAuthDataSource();

  Future<Map<String, String>> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw const AuthException('Email and password are required.');
    }

    return <String, String>{
      'id': 'mock-user-001',
      'name': 'Alex',
      'email': email,
    };
  }
}
