// ignore_for_file: must_be_immutable

part of 'received_requests_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReceivedRequests widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReceivedRequestsEvent extends Equatable {}

/// Event that is dispatched when the ReceivedRequests widget is first created.
class ReceivedRequestsInitialEvent extends ReceivedRequestsEvent {
  @override
  List<Object?> get props => [];
}
