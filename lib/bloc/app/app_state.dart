part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class Authenticated extends AppState {
  final String token;
  final String name;

  Authenticated(this.token, this.name);
}

class Unauthenticated extends AppState {}