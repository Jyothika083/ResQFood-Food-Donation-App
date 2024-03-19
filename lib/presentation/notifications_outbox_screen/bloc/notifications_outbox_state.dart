// ignore_for_file: must_be_immutable

part of 'notifications_outbox_bloc.dart';

/// Represents the state of NotificationsOutbox in the application.
class NotificationsOutboxState extends Equatable {
  NotificationsOutboxState({this.notificationsOutboxModelObj});

  NotificationsOutboxModel? notificationsOutboxModelObj;

  @override
  List<Object?> get props => [
        notificationsOutboxModelObj,
      ];
  NotificationsOutboxState copyWith(
      {NotificationsOutboxModel? notificationsOutboxModelObj}) {
    return NotificationsOutboxState(
      notificationsOutboxModelObj:
          notificationsOutboxModelObj ?? this.notificationsOutboxModelObj,
    );
  }
}
