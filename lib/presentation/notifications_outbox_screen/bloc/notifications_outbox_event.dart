// ignore_for_file: must_be_immutable

part of 'notifications_outbox_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NotificationsOutbox widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NotificationsOutboxEvent extends Equatable {}

/// Event that is dispatched when the NotificationsOutbox widget is first created.
class NotificationsOutboxInitialEvent extends NotificationsOutboxEvent {
  @override
  List<Object?> get props => [];
}
