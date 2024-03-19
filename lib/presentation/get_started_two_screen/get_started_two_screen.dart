import 'bloc/get_started_two_bloc.dart';
import 'models/get_started_two_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedTwoScreen extends StatelessWidget {
  const GetStartedTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<GetStartedTwoBloc>(
      create: (context) => GetStartedTwoBloc(GetStartedTwoState(
        getStartedTwoModelObj: GetStartedTwoModel(),
      ))
        ..add(GetStartedTwoInitialEvent()),
      child: GetStartedTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStartedTwoBloc, GetStartedTwoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 23.h,
                right: 23.h,
                bottom: 72.v,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 91.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage100,
                    height: 208.v,
                    width: 347.h,
                  ),
                  SizedBox(height: 61.v),
                  Container(
                    width: 323.h,
                    margin: EdgeInsets.only(
                      left: 14.h,
                      right: 8.h,
                    ),
                    child: Text(
                      "msg_track_your_donations".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleLargeDeeporange50001,
                    ),
                  ),
                  SizedBox(height: 77.v),
                  SizedBox(
                    height: 15.v,
                    child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 2,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Color(0X1212121D),
                        dotHeight: 15.v,
                      ),
                    ),
                  ),
                  SizedBox(height: 59.v),
                  CustomElevatedButton(
                    width: 212.h,
                    text: "lbl_get_started".tr,
                    buttonStyle: CustomButtonStyles.fillDeepOrange,
                    buttonTextStyle:
                        CustomTextStyles.headlineSmallOnPrimaryContainer,
                    onPressed: () {
                      onTapSkip(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  onTapSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgResqfoodHighR,
        margin: EdgeInsets.only(
          left: 14.h,
          right: 322.h,
        ),
      ),
    );
  }
}
