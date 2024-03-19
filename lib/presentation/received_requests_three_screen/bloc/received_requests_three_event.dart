// ignore_for_file: must_be_immutable

part of 'received_requests_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReceivedRequestsThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReceivedRequestsThreeEvent extends Equatable {}

/// Event that is dispatched when the ReceivedRequestsThree widget is first created.
class ReceivedRequestsThreeInitialEvent extends ReceivedRequestsThreeEvent {
  @override
  List<Object?> get props => [];
}
