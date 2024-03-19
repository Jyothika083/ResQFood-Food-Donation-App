import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/get_started_two_screen/models/get_started_two_model.dart';
part 'get_started_two_event.dart';
part 'get_started_two_state.dart';

/// A bloc that manages the state of a GetStartedTwo according to the event that is dispatched to it.
class GetStartedTwoBloc extends Bloc<GetStartedTwoEvent, GetStartedTwoState> {
  GetStartedTwoBloc(GetStartedTwoState initialState) : super(initialState) {
    on<GetStartedTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    GetStartedTwoInitialEvent event,
    Emitter<GetStartedTwoState> emit,
  ) async {}
}
