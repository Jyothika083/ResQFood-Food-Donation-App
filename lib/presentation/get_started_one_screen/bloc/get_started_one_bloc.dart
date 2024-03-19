import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/get_started_one_screen/models/get_started_one_model.dart';
part 'get_started_one_event.dart';
part 'get_started_one_state.dart';

/// A bloc that manages the state of a GetStartedOne according to the event that is dispatched to it.
class GetStartedOneBloc extends Bloc<GetStartedOneEvent, GetStartedOneState> {
  GetStartedOneBloc(GetStartedOneState initialState) : super(initialState) {
    on<GetStartedOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    GetStartedOneInitialEvent event,
    Emitter<GetStartedOneState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.getStartedScreen,
      );
    });
  }
}
