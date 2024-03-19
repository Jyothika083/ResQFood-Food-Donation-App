// ignore_for_file: must_be_immutable

part of 'profile_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileContainerEvent extends Equatable {}

/// Event that is dispatched when the ProfileContainer widget is first created.
class ProfileContainerInitialEvent extends ProfileContainerEvent {
  @override
  List<Object?> get props => [];
}
