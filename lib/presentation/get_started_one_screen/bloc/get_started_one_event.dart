// ignore_for_file: must_be_immutable

part of 'get_started_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GetStartedOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class GetStartedOneEvent extends Equatable {}

/// Event that is dispatched when the GetStartedOne widget is first created.
class GetStartedOneInitialEvent extends GetStartedOneEvent {
  @override
  List<Object?> get props => [];
}
