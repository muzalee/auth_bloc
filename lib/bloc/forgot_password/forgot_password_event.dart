part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class TogglePage extends ForgotPasswordEvent {
  final int pageIndex;

  const TogglePage({required this.pageIndex});
}