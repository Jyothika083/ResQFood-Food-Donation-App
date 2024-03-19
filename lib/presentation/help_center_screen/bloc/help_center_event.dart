// ignore_for_file: must_be_immutable

part of 'help_center_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HelpCenter widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HelpCenterEvent extends Equatable {}

/// Event that is dispatched when the HelpCenter widget is first created.
class HelpCenterInitialEvent extends HelpCenterEvent {
  @override
  List<Object?> get props => [];
}
