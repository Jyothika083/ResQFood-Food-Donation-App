// ignore_for_file: must_be_immutable

part of 'notifications_inbox_bloc.dart';

/// Represents the state of NotificationsInbox in the application.
class NotificationsInboxState extends Equatable {
  NotificationsInboxState({this.notificationsInboxModelObj});

  NotificationsInboxModel? notificationsInboxModelObj;

  @override
  List<Object?> get props => [
        notificationsInboxModelObj,
      ];
  NotificationsInboxState copyWith(
      {NotificationsInboxModel? notificationsInboxModelObj}) {
    return NotificationsInboxState(
      notificationsInboxModelObj:
          notificationsInboxModelObj ?? this.notificationsInboxModelObj,
    );
  }
}
