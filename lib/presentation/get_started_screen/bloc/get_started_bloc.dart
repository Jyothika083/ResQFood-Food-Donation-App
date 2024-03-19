import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/get_started_screen/models/get_started_model.dart';
part 'get_started_event.dart';
part 'get_started_state.dart';

/// A bloc that manages the state of a GetStarted according to the event that is dispatched to it.
class GetStartedBloc extends Bloc<GetStartedEvent, GetStartedState> {
  GetStartedBloc(GetStartedState initialState) : super(initialState) {
    on<GetStartedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    GetStartedInitialEvent event,
    Emitter<GetStartedState> emit,
  ) async {}
}
