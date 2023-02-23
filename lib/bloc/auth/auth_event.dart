part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class TogglePage extends AuthEvent {
  final bool isLogin;

  const TogglePage({required this.isLogin});
}