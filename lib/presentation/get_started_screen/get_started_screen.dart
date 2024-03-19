import 'bloc/get_started_bloc.dart';
import 'models/get_started_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<GetStartedBloc>(
      create: (context) => GetStartedBloc(GetStartedState(
        getStartedModelObj: GetStartedModel(),
      ))
        ..add(GetStartedInitialEvent()),
      child: GetStartedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStartedBloc, GetStartedState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // Navigate to Screen 2
            onTapAnywhere(context);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: _buildAppBar(context),
              body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 70.v,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 88.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgImage101,
                      height: 211.v,
                      width: 362.h,
                    ),
                    SizedBox(height: 65.v),
                    Container(
                      width: 329.h,
                      margin: EdgeInsets.only(
                        left: 24.h,
                        right: 8.h,
                      ),
                      child: Text(
                        "msg_browse_through_the".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleLargeDeeporange50001,
                      ),
                    ),
                    Spacer(),
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
                    SizedBox(height: 54.v),
                    CustomElevatedButton(
                      width: 89.h,
                      text: "lbl_skip".tr,
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
          ),
        );
      },
    );
  }

  onTapAnywhere(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.getStartedTwoScreen);
  }

  onTapSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgResqfoodHighR,
        margin: EdgeInsets.only(
          left: 12.h,
          right: 324.h,
        ),
      ),
    );
  }
}
