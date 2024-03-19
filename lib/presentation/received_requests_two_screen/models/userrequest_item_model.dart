import '../../../core/app_export.dart';

/// This class is used in the [userrequest_item_widget] screen.
class UserrequestItemModel {
  UserrequestItemModel({
    this.userImage,
    this.requestText,
    this.confirmButtonText,
    this.declineButtonText,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgImage26;
    requestText = requestText ?? "Someone is in need of Bread and grains ";
    confirmButtonText = confirmButtonText ?? "confirm";
    declineButtonText = declineButtonText ?? "decline";
    id = id ?? "";
  }

  String? userImage;

  String? requestText;

  String? confirmButtonText;

  String? declineButtonText;

  String? id;
}
