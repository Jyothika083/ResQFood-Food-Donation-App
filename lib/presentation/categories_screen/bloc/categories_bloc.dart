import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/categories_screen/models/categories_model.dart';
part 'categories_event.dart';
part 'categories_state.dart';

/// A bloc that manages the state of a Categories according to the event that is dispatched to it.
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(CategoriesState initialState) : super(initialState) {
    on<CategoriesInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CategoriesInitialEvent event,
    Emitter<CategoriesState> emit,
  ) async {}
}
