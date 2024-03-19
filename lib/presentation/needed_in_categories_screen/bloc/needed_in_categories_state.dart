// ignore_for_file: must_be_immutable

part of 'needed_in_categories_bloc.dart';

/// Represents the state of NeededInCategories in the application.
class NeededInCategoriesState extends Equatable {
  NeededInCategoriesState({
    this.categoryController,
    this.itemController,
    this.enterQuantityController,
    this.pickupLocalityController,
    this.neededInCategoriesModelObj,
  });

  TextEditingController? categoryController;
  TextEditingController? itemController;
  TextEditingController? enterQuantityController;
  TextEditingController?  pickupLocalityController;
  NeededInCategoriesModel? neededInCategoriesModelObj;

  @override
  List<Object?> get props => [
        categoryController,
        itemController,
        enterQuantityController,
        pickupLocalityController,
        neededInCategoriesModelObj,
      ];
  NeededInCategoriesState copyWith({
    TextEditingController? categoryController,
    TextEditingController? itemController,
    TextEditingController? enterQuantityController,
    TextEditingController? pickupLocalityController,
    NeededInCategoriesModel? neededInCategoriesModelObj,
  }) {
    return NeededInCategoriesState(
      categoryController: categoryController ?? this.categoryController,
      itemController: itemController ?? this.itemController,
      pickupLocalityController:  pickupLocalityController ?? this. pickupLocalityController,
      enterQuantityController:
          enterQuantityController ?? this.enterQuantityController,
      neededInCategoriesModelObj:
          neededInCategoriesModelObj ?? this.neededInCategoriesModelObj,
    );
  }
}
