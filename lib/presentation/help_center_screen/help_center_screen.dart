import 'bloc/help_center_bloc.dart';
import 'models/help_center_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/app_bar/appbar_leading_image.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';

// ignore_for_file: must_be_immutable
class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HelpCenterBloc>(
        create: (context) => HelpCenterBloc(
            HelpCenterState(helpCenterModelObj: HelpCenterModel()))
          ..add(HelpCenterInitialEvent()),
        child: HelpCenterScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterBloc, HelpCenterState>(
        builder: (context, state) {
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
                            horizontal: 19.h, vertical: 17.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder15),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 21.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text("lbl_faqs".tr,
                                      style: CustomTextStyles
                                          .headlineSmallInterGreen900)),
                              SizedBox(height: 37.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: Column(children: [
                                    SizedBox(
                                        width: 300.h,
                                        child: Text("msg_q1_how_does_food".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: CustomTextStyles
                                                .bodyLargeInterDeeporange500)),
                                    SizedBox(height: 1.v),
                                    SizedBox(
                                        width: 300.h,
                                        child: Text("msg_a_users_can_simply".tr,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: CustomTextStyles
                                                .bodyLargeInter)),
                                    SizedBox(height: 10.v),
                                    SizedBox(
                                        width: 300.h,
                                        child: Text("msg_q2_what_types_of".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: CustomTextStyles
                                                .bodyLargeInterDeeporange500)),
                                    SizedBox(height: 9.v),
                                    Column(children: [
                                      SizedBox(
                                          width: 300.h,
                                          child: Text(
                                              "msg_a_most_non_perishable".tr,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              style: CustomTextStyles
                                                  .bodyLargeInter)),
                                      SizedBox(height: 8.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("msg_q3_can_i_track".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeInterDeeporange500)),
                                      SizedBox(height: 6.v),
                                      SizedBox(
                                          width: 300.h,
                                          child: Text("msg_a_yes_our_app".tr,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              style: CustomTextStyles
                                                  .bodyLargeInter))
                                    ])
                                  ]))
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
        centerTitle: true,
        title: AppbarTitle(text: "lbl_help_center".tr));
  }

  /// Section Widget
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
