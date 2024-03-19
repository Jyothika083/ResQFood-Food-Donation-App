import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
    this.onTapConfirmButton,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  VoidCallback? onTapConfirmButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 13.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: userprofileItemModelObj?.userImage,
                  height: 48.v,
                  width: 71.h,
                  margin: EdgeInsets.only(top: 1.v),
                ),
                Expanded(
                  child: Container(
                    width: 232.h,
                    margin: EdgeInsets.only(left: 4.h),
                    child: Text(
                      userprofileItemModelObj.someoneIsInNeed!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 19.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 26.h,
                right: 34.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    height: 25.v,
                    width: 100.h,
                    text: "lbl_confirm".tr,
                    buttonTextStyle:
                        CustomTextStyles.bodyMediumInterOnPrimaryContainer,
                    onPressed: () {
                      onTapConfirmButton!.call();
                    },
                  ),
                  CustomElevatedButton(
                    height: 25.v,
                    width: 100.h,
                    text: "lbl_decline".tr,
                    buttonStyle: CustomButtonStyles.fillDeepOrangeTL12,
                    buttonTextStyle:
                        CustomTextStyles.bodyMediumInterOnPrimaryContainer,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
