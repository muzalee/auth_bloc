part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class AppInit extends AppEvent {}

class LoggedIn extends AppEvent {}