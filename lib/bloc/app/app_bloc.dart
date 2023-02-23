import 'package:auth_bloc/configs/assets.dart';
import 'package:auth_bloc/data/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final UserRepo _userRepo = UserRepo();
  final BuildContext context;

  AppBloc({required this.context}) : super(AppInitial()) {
    on<AppInit>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
  }

  Future<void> _onAppStarted(AppInit event, Emitter<AppState> emit) async {
    await AppIcons.precacheAssets(context);
    final String? token = await _userRepo.getToken();

    if (token != null) {
      final String? name = await _userRepo.getName();
      emit(Authenticated(token, name ?? ''));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AppState> emit) async {
    final String? token = await _userRepo.getToken();
    final String? name = await _userRepo.getName();

    emit(Authenticated(token ?? '', name ?? ''));
  }
}
