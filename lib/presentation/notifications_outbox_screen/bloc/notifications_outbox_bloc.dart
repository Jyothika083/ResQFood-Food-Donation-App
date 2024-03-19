import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/notifications_outbox_screen/models/notifications_outbox_model.dart';
part 'notifications_outbox_event.dart';
part 'notifications_outbox_state.dart';

/// A bloc that manages the state of a NotificationsOutbox according to the event that is dispatched to it.
class NotificationsOutboxBloc
    extends Bloc<NotificationsOutboxEvent, NotificationsOutboxState> {
  NotificationsOutboxBloc(NotificationsOutboxState initialState)
      : super(initialState) {
    on<NotificationsOutboxInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsOutboxInitialEvent event,
    Emitter<NotificationsOutboxState> emit,
  ) async {}
}
