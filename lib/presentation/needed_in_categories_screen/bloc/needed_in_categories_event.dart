// ignore_for_file: must_be_immutable

part of 'needed_in_categories_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NeededInCategories widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NeededInCategoriesEvent extends Equatable {}

/// Event that is dispatched when the NeededInCategories widget is first created.
class NeededInCategoriesInitialEvent extends NeededInCategoriesEvent {
  @override
  List<Object?> get props => [];
}
