// ignore_for_file: must_be_immutable

part of 'received_requests_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReceivedRequestsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReceivedRequestsOneEvent extends Equatable {}

/// Event that is dispatched when the ReceivedRequestsOne widget is first created.
class ReceivedRequestsOneInitialEvent extends ReceivedRequestsOneEvent {
  @override
  List<Object?> get props => [];
}
