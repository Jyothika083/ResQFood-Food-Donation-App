import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/signup_screen/models/signup_model.dart';
part 'signup_event.dart';
part 'signup_state.dart';

/// A bloc that manages the state of a Signup according to the event that is dispatched to it.
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(SignupState initialState) : super(initialState) {
    on<SignupInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(termsAndConditionsCheckbox: event.value));
  }

  _onInitialize(
    SignupInitialEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
        usernameController: TextEditingController(),
        emailController: TextEditingController(),
        phoneController: TextEditingController(),
        passwordController: TextEditingController(),
        termsAndConditionsCheckbox: false));
  }
}
