import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/help_center_screen/models/help_center_model.dart';
part 'help_center_event.dart';
part 'help_center_state.dart';

/// A bloc that manages the state of a HelpCenter according to the event that is dispatched to it.
class HelpCenterBloc extends Bloc<HelpCenterEvent, HelpCenterState> {
  HelpCenterBloc(HelpCenterState initialState) : super(initialState) {
    on<HelpCenterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HelpCenterInitialEvent event,
    Emitter<HelpCenterState> emit,
  ) async {}
}
