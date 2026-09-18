import 'package:vtqp_flutter_gym_sample/features/auth/domain/entities/user.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.user);
  final User user;
}

class LoginFailure extends LoginState {
  const LoginFailure(this.message);
  final String message;
}
