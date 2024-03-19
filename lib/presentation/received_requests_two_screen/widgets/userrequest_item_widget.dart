import '../models/userrequest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';

// ignore: must_be_immutable
class UserrequestItemWidget extends StatelessWidget {
  UserrequestItemWidget(
    this.userrequestItemModelObj, {
    Key? key,
    this.onTapPrimaryButton,
    this.onTapTxtConfirmButtonText,
    this.onTapPrimaryButton1,
  }) : super(
          key: key,
        );

  UserrequestItemModel userrequestItemModelObj;

  VoidCallback? onTapPrimaryButton;

  VoidCallback? onTapTxtConfirmButtonText;

  VoidCallback? onTapPrimaryButton1;

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
                  imagePath: userrequestItemModelObj?.userImage,
                  height: 59.v,
                  width: 67.h,
                ),
                Expanded(
                  child: Container(
                    width: 232.h,
                    margin: EdgeInsets.only(
                      left: 8.h,
                      bottom: 4.v,
                    ),
                    child: Text(
                      userrequestItemModelObj.requestText!,
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
          SizedBox(height: 10.v),
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
                  GestureDetector(
                    onTap: () {
                      onTapPrimaryButton!.call();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.fillGreen900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtConfirmButtonText!.call();
                        },
                        child: Text(
                          userrequestItemModelObj.confirmButtonText!,
                          style: CustomTextStyles
                              .bodyMediumInterOnPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapPrimaryButton1!.call();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.h,
                        vertical: 2.v,
                      ),
                      decoration: AppDecoration.fillDeepOrange.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12,
                      ),
                      child: Text(
                        userrequestItemModelObj.declineButtonText!,
                        style:
                            CustomTextStyles.bodyMediumInterOnPrimaryContainer,
                      ),
                    ),
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
