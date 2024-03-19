import '../models/profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget(
    this.profileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileItemModel profileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 98.h,
      child: CustomImageView(
        imagePath: profileItemModelObj?.simpleModernD,
        height: 110.v,
        width: 98.h,
        margin: EdgeInsets.only(left: 3.h),
      ),
    );
  }
}
