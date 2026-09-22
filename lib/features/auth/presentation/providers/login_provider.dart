import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vtqp_flutter_gym_sample/features/auth/data/datasources/mock_auth_data_source.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/domain/repositories/auth_repository.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/domain/usecases/login_usecase.dart';
import 'package:vtqp_flutter_gym_sample/features/auth/presentation/providers/login_state.dart';

// --- Composition (DI) ---

final mockAuthDataSourceProvider = Provider<MockAuthDataSource>((ref) {
  return const MockAuthDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository(ref.watch(mockAuthDataSourceProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

// --- Observable state ---

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.watch(loginUseCaseProvider));
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this._loginUseCase) : super(const LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const LoginLoading();
    try {
      final user = await _loginUseCase(email: email, password: password);
      state = LoginSuccess(user);
    } catch (e) {
      state = LoginFailure(e.toString());
    }
  }
}
