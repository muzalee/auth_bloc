part of 'auth_bloc.dart';

@immutable
class AuthState {
  final bool isLogin;

  const AuthState({this.isLogin = true});

  factory AuthState.initial() {
    return const AuthState(isLogin: true);
  }

  AuthState copyWith({
    bool? isLogin,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
    );
  }
}