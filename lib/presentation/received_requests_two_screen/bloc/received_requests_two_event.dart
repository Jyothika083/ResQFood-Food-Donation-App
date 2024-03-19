// ignore_for_file: must_be_immutable

part of 'received_requests_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReceivedRequestsTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReceivedRequestsTwoEvent extends Equatable {}

/// Event that is dispatched when the ReceivedRequestsTwo widget is first created.
class ReceivedRequestsTwoInitialEvent extends ReceivedRequestsTwoEvent {
  @override
  List<Object?> get props => [];
}
