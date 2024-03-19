import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';
import 'bloc/notifications_outbox_bloc.dart';
import 'models/notifications_outbox_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationsOutboxScreen extends StatelessWidget {
  NotificationsOutboxScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsOutboxBloc>(
        create: (context) => NotificationsOutboxBloc(NotificationsOutboxState(
            notificationsOutboxModelObj: NotificationsOutboxModel()))
          ..add(NotificationsOutboxInitialEvent()),
        child: NotificationsOutboxScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsOutboxBloc, NotificationsOutboxState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.h, vertical: 47.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 1.h, right: 66.h),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgResqfoodHighR,
                                  height: 64.v,
                                  width: 57.h,
                                  onTap: () {
                                    onTapImgResqfoodHighR(context);
                                  }),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 21.h, top: 9.v, bottom: 8.v),
                                  child: Text("lbl_notifications".tr,
                                      style: theme.textTheme.displaySmall))
                            ])),
                        SizedBox(height: 15.v),
                        Container(
                            margin: EdgeInsets.only(right: 11.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.h, vertical: 18.v),
                            decoration: AppDecoration.outlineBlack900.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder15),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 26.h, right: 22.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  onTapTxtInbox(context);
                                                },
                                                child: Text("lbl_inbox".tr,
                                                    style: theme.textTheme
                                                        .headlineLarge)),
                                            Text("lbl_outbox".tr,
                                                style: CustomTextStyles
                                                    .headlineLargeGreen900_1)
                                          ])),
                                  SizedBox(height: 11.v),
                                  Divider(color: appTheme.orangeA700),
                                  SizedBox(height: 20.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 253.h,
                                          margin: EdgeInsets.only(
                                              left: 14.h, right: 62.h),
                                          child: Text("msg_we_have_sent_the".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  theme.textTheme.titleLarge))),
                                  SizedBox(height: 20.v)
                                ])),
                        SizedBox(height: 5.v)
                      ])),
              bottomNavigationBar: _buildBottomBar(context)));
    });
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
        return "/";
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
      default:
        return DefaultWidget();
    }
  }


  /// Navigates to the homePageScreen when the action is triggered.
  onTapImgResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }

  /// Navigates to the notificationsInboxScreen when the action is triggered.
  onTapTxtInbox(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationsInboxScreen,
    );
  }
}
