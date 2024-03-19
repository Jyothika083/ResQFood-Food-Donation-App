import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'bloc/home_page_bloc.dart';
import 'models/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static Widget builder(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (context) => HomePageBloc(HomePageState(
        homePageModelObj: HomePageModel(),
      ))
        ..add(HomePageInitialEvent()),
      child: HomePageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 36.v),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 8.v,
                    ),
                    decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 134.v,
                          width: 312.h,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 301.h,
                                  child: Text(
                                    "msg_hey_hope_you".tr,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyles.headlineSmallGreen900,
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgKawaiiRice,
                                height: 52.v,
                                width: 46.h,
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.v),
                        Container(
                          margin: EdgeInsets.only(left: 6.h),
                          padding: EdgeInsets.symmetric(horizontal: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 280.h,
                                child: Text(
                                  "msg_heartfelt_thanks".tr,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.displayMedium,
                                ),
                              ),
                              SizedBox(height: 7.v),
                              CustomImageView(
                                imagePath: ImageConstant.imgImage31,
                                height: 162.v,
                                width: 125.h,
                                margin: EdgeInsets.only(left: 71.h),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgResqfoodHighR,
        margin: EdgeInsets.only(left: 23.h),
      ),
      title: AppbarTitle(
        text: "lbl_home".tr,
        margin: EdgeInsets.only(left: 31.h),
      ),
    );
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
      case AppRoutes.categoriesScreen:
        return CategoriesScreen();
      case AppRoutes.notificationsInboxScreen:
        return NotificationsInboxScreen();
      default:
        return DefaultWidget();
    }
  }
}
