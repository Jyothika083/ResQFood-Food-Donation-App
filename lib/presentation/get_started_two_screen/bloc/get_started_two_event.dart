// ignore_for_file: must_be_immutable

part of 'get_started_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GetStartedTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class GetStartedTwoEvent extends Equatable {}

/// Event that is dispatched when the GetStartedTwo widget is first created.
class GetStartedTwoInitialEvent extends GetStartedTwoEvent {
  @override
  List<Object?> get props => [];
}
