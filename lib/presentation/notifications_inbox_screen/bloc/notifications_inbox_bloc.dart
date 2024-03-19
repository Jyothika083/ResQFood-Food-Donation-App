import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/models/notifications_inbox_model.dart';
part 'notifications_inbox_event.dart';
part 'notifications_inbox_state.dart';

/// A bloc that manages the state of a NotificationsInbox according to the event that is dispatched to it.
class NotificationsInboxBloc
    extends Bloc<NotificationsInboxEvent, NotificationsInboxState> {
  NotificationsInboxBloc(NotificationsInboxState initialState)
      : super(initialState) {
    on<NotificationsInboxInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationsInboxInitialEvent event,
    Emitter<NotificationsInboxState> emit,
  ) async {}
}
