part of 'forgot_password_bloc.dart';

@immutable
class ForgotPasswordState {
  final int pageIndex;

  const ForgotPasswordState({this.pageIndex = 0});

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(pageIndex: 0);
  }

  ForgotPasswordState copyWith({
    int? pageIndex,
  }) {
    return ForgotPasswordState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}