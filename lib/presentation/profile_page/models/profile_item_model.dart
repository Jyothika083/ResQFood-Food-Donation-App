import '../../../core/app_export.dart';

/// This class is used in the [profile_item_widget] screen.
class ProfileItemModel {
  ProfileItemModel({
    this.simpleModernD,
    this.id,
  }) {
    simpleModernD = simpleModernD ?? ImageConstant.imgSimpleModernD;
    id = id ?? "";
  }

  String? simpleModernD;

  String? id;
}
