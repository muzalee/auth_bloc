import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<TogglePage>(_onToggle);
  }

  Future<void> _onToggle(TogglePage event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      isLogin: event.isLogin,
    ));
  }
}
