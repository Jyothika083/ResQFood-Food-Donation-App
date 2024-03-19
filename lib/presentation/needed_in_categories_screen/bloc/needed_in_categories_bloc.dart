import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/needed_in_categories_screen/models/needed_in_categories_model.dart';
part 'needed_in_categories_event.dart';
part 'needed_in_categories_state.dart';

/// A bloc that manages the state of a NeededInCategories according to the event that is dispatched to it.
class NeededInCategoriesBloc
    extends Bloc<NeededInCategoriesEvent, NeededInCategoriesState> {
  NeededInCategoriesBloc(NeededInCategoriesState initialState)
      : super(initialState) {
    on<NeededInCategoriesInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NeededInCategoriesInitialEvent event,
    Emitter<NeededInCategoriesState> emit,
  ) async {
    emit(state.copyWith(
        categoryController: TextEditingController(),
        itemController: TextEditingController(),
        pickupLocalityController: TextEditingController(),
        enterQuantityController: TextEditingController()));
  }
}
