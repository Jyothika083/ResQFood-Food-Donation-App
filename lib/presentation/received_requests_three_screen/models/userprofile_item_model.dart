import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.someoneIsInNeed,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgImage22;
    someoneIsInNeed = someoneIsInNeed ?? "Someone is in need of fruits ";
    id = id ?? "";
  }

  String? userImage;

  String? someoneIsInNeed;

  String? id;
}
