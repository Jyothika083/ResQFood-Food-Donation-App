import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';
import 'bloc/categories_bloc.dart';
import 'models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<CategoriesBloc>(
        create: (context) => CategoriesBloc(
            CategoriesState(categoriesModelObj: CategoriesModel()))
          ..add(CategoriesInitialEvent()),
        child: CategoriesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 6.v),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.h),
                        child: Column(children: [
                          _buildAvailable(context),
                          SizedBox(height: 9.v),
                          Divider(),
                          SizedBox(height: 15.v),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 21.h),
                              decoration: AppDecoration.outlineBlack,
                              child: _buildCategories(context))
                        ]))
                  ])),
              bottomNavigationBar: _buildBottomBar(context),
              floatingActionButton: _buildFloatingActionButton(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 74.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgResqfoodHighR,
            margin: EdgeInsets.only(left: 17.h),
            onTap: () {
              onTapResqfoodHighR(context);
            }),
        title: AppbarTitle(
            text: "lbl_categories".tr,
            margin: EdgeInsets.only(left: 51.h),
            onTap: () {
              onTapCategories(context);
            }));
  }

  /// Section Widget
  Widget _buildAvailable(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 22.h, right: 29.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_available".tr, style: theme.textTheme.headlineLarge),
          GestureDetector(
              onTap: () {
                onTapTxtNeeded(context);
              },
              child:
                  Text("lbl_needed".tr, style: theme.textTheme.headlineLarge))
        ]));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Container(
        width: 336.h,
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 4.v),
        decoration: AppDecoration.outlineBlack900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 5.h, right: 82.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage20,
                        height: 34.v,
                        width: 57.h),
                    Padding(
                        padding: EdgeInsets.only(left: 32.h),
                        child: Text("lbl_cooked_food".tr,
                            style: theme.textTheme.headlineSmall))
                  ])),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 14.h, right: 80.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage21,
                        height: 73.v,
                        width: 40.h),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 40.h, top: 22.v, bottom: 20.v),
                        child: Text("lbl_canned_food".tr,
                            style: theme.textTheme.headlineSmall))
                  ])),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage22,
                        height: 48.v,
                        width: 71.h),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 24.h, top: 9.v, bottom: 8.v),
                        child: Text("lbl_fruits".tr,
                            style: theme.textTheme.headlineSmall))
                  ])),
              SizedBox(height: 24.v),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgImage23,
                    height: 37.v,
                    width: 67.h,
                    margin: EdgeInsets.only(bottom: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 32.h, top: 8.v),
                    child: Text("lbl_veggies".tr,
                        style: theme.textTheme.headlineSmall))
              ]),
              SizedBox(height: 36.v),
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage24,
                        height: 37.v,
                        width: 67.h),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 33.h, top: 2.v, bottom: 3.v),
                        child: Text("lbl_leftovers".tr,
                            style: theme.textTheme.headlineSmall))
                  ])),
              SizedBox(height: 23.v),
              Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage25,
                        height: 73.v,
                        width: 66.h),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 29.h, top: 25.v, bottom: 17.v),
                        child: Text("lbl_beverages".tr,
                            style: theme.textTheme.headlineSmall))
                  ])),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h, right: 78.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgImage26,
                            height: 59.v,
                            width: 67.h),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 29.h, top: 7.v, bottom: 20.v),
                            child: Text("lbl_grains_bread".tr,
                                style: theme.textTheme.headlineSmall))
                      ])),
              SizedBox(height: 5.v)
            ]));
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

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(height: 53, width: 51, child: Icon(Icons.add));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Categories:
        return "/";
      case BottomBarEnum.Requests:
        return AppRoutes.receivedRequestsTwoScreen;
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsInboxScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileContainerScreen;
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
      case AppRoutes.profileContainerScreen:
        return ProfileContainerScreen();
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

  /// Navigates to the homePageScreen when the action is triggered.
  onTapCategories(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }

  /// Navigates to the neededInCategoriesScreen when the action is triggered.
  onTapTxtNeeded(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.neededInCategoriesScreen,
    );
  }
}
