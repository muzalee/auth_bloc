import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState.initial()) {
    on<TogglePage>(_onToggle);
  }

  Future<void> _onToggle(TogglePage event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(
      pageIndex: event.pageIndex,
    ));
  }
}
