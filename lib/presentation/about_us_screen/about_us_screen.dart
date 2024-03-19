import 'bloc/about_us_bloc.dart';
import 'models/about_us_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';

// ignore_for_file: must_be_immutable
class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<AboutUsBloc>(
        create: (context) =>
            AboutUsBloc(AboutUsState(aboutUsModelObj: AboutUsModel()))
              ..add(AboutUsInitialEvent()),
        child: AboutUsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 20.v),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 26.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.h, vertical: 16.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder15),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 4.v),
                              Container(
                                  width: 307.h,
                                  margin: EdgeInsets.only(left: 3.h),
                                  child: Text("msg_welcome_to_resqfood".tr,
                                      maxLines: 13,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: CustomTextStyles.bodyLarge16)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("lbl_founders".tr,
                                      style: CustomTextStyles
                                          .headlineSmallDeeporange600)),
                              SizedBox(height: 7.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.h, right: 30.h),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse3,
                                        height: 40.adaptSize,
                                        width: 40.adaptSize,
                                        radius: BorderRadius.circular(20.h)),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.h, top: 3.v, bottom: 10.v),
                                        child: Text("Jeevanthi Kashyap",
                                            style: theme.textTheme.titleLarge)),
                                    Spacer(),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage28,
                                        height: 25.adaptSize,
                                        width: 25.adaptSize,
                                        margin: EdgeInsets.only(
                                            top: 8.v, bottom: 7.v))
                                  ])),
                              SizedBox(height: 18.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.h, right: 30.h),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse4,
                                        height: 40.adaptSize,
                                        width: 40.adaptSize,
                                        radius: BorderRadius.circular(20.h)),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.h, top: 3.v, bottom: 10.v),
                                        child: Text("lbl_jyothika_c_n".tr,
                                            style: theme.textTheme.titleLarge)),
                                    Spacer(),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage28,
                                        height: 25.adaptSize,
                                        width: 25.adaptSize,
                                        margin: EdgeInsets.only(
                                            top: 8.v, bottom: 7.v))
                                  ])),
                              SizedBox(height: 12.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.h, right: 30.h),
                                  child: _buildFoundersRow(context,
                                      pallePadmavathi:
                                          "msg_palle_padmavathi".tr)),
                              SizedBox(height: 5.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 103.h),
                                  child: Text("lbl_contact".tr,
                                      style: CustomTextStyles
                                          .headlineSmallDeeporange600)),
                              SizedBox(height: 7.v),
                              Container(
                                  width: 204.h,
                                  margin: EdgeInsets.only(left: 12.h),
                                  child: Text(
                                      "msg_080_xxxxxx_resqfood_gmail_com".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.titleLarge))
                            ]))
                  ])),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 76.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgResqfoodHighR,
            margin: EdgeInsets.only(left: 19.h),
            onTap: () {
              onTapResqfoodHighR(context);
            }),
        title: AppbarTitle(
            text: "lbl_about_us".tr, margin: EdgeInsets.only(left: 23.h)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        print("Bottom bar tapped: $type");
        final currentRoute = getCurrentRoute(type);
        if (currentRoute != null) {
          Navigator.of(context).pushNamed(currentRoute);
        }
      },
    );
  }

  // Common widget
  Widget _buildFoundersRow(
    BuildContext context, {
    required String pallePadmavathi,
  }) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgEllipse5,
          height: 40.adaptSize,
          width: 40.adaptSize,
          radius: BorderRadius.circular(20.h)),
      Padding(
          padding: EdgeInsets.only(left: 22.h, top: 4.v, bottom: 9.v),
          child: Text(pallePadmavathi,
              style: theme.textTheme.titleLarge!
                  .copyWith(color: appTheme.black900))),
      CustomImageView(
          imagePath: ImageConstant.imgImage28,
          height: 25.adaptSize,
          width: 25.adaptSize,
          margin: EdgeInsets.only(left: 27.h, top: 8.v, bottom: 7.v))
    ]);
  }



  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Categories:
        return AppRoutes.categoriesScreen;
      case BottomBarEnum.Requests:
        return AppRoutes.receivedRequestsTwoScreen;
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsInboxScreen;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
      BuildContext context,
      String currentRoute,
      ) {
    switch (currentRoute) {
      case AppRoutes.receivedRequestsTwoScreen:
        return ReceivedRequestsTwoScreen();
      case AppRoutes.categoriesScreen:
        return CategoriesScreen();
      case AppRoutes.notificationsInboxScreen:
        return NotificationsInboxScreen();
      default:
        return DefaultWidget();
    }
  }
  /// Navigates to the homePageScreen when the action is triggered.
  onTapResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
