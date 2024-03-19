import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/received_requests_one_screen/models/received_requests_one_model.dart';
part 'received_requests_one_event.dart';
part 'received_requests_one_state.dart';

/// A bloc that manages the state of a ReceivedRequestsOne according to the event that is dispatched to it.
class ReceivedRequestsOneBloc
    extends Bloc<ReceivedRequestsOneEvent, ReceivedRequestsOneState> {
  ReceivedRequestsOneBloc(ReceivedRequestsOneState initialState)
      : super(initialState) {
    on<ReceivedRequestsOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReceivedRequestsOneInitialEvent event,
    Emitter<ReceivedRequestsOneState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        nameController1: TextEditingController()));
  }
}
