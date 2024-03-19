// ignore_for_file: must_be_immutable

part of 'notifications_inbox_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NotificationsInbox widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NotificationsInboxEvent extends Equatable {}

/// Event that is dispatched when the NotificationsInbox widget is first created.
class NotificationsInboxInitialEvent extends NotificationsInboxEvent {
  @override
  List<Object?> get props => [];
}
