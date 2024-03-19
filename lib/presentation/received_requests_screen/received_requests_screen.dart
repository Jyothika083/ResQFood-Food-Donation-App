import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';

import '../../services/receivedRequests.dart';
import 'bloc/received_requests_bloc.dart';
import 'models/received_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:ResQFood/widgets/custom_text_form_field.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsScreen extends StatelessWidget {
  ReceivedRequestsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsBloc>(
        create: (context) => ReceivedRequestsBloc(ReceivedRequestsState(
            receivedRequestsModelObj: ReceivedRequestsModel()))
          ..add(ReceivedRequestsInitialEvent()),
        child: ReceivedRequestsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 34.v),
          child: Column(
            children: [
              SizedBox(height: 6.v),
              _buildResqfoodHighR(context),
              SizedBox(height: 39.v),
              _buildSelectCategory(context),
              SizedBox(height: 56.v),
              CustomElevatedButton(
                width: 225.h,
                text: "msg_complete_request".tr,
                buttonStyle: CustomButtonStyles.fillOrangeA,
                onPressed: () async{
                  var categoryController = context.read<ReceivedRequestsBloc>().state.categoryController;
                  var itemController = context.read<ReceivedRequestsBloc>().state.itemController;
                  var quantityController = context.read<ReceivedRequestsBloc>().state.quantityController;
                  var ngoNumberController = context.read<ReceivedRequestsBloc>().state.ngoNumberController;
                  if (categoryController != null && itemController != null && quantityController != null && ngoNumberController != null) {
                    var category = categoryController.text.trim();
                    var item = itemController.text.trim();
                    var quantity = quantityController.text.trim();
                    var ngoNum = ngoNumberController.text.trim();

                    // Retrieve the current user ID
                    // var userId = FirebaseAuth.instance.currentUser?.uid;
                    //
                    // if (userId != null) {
                    try {
                      // Store the donation information
                      await donate(category, item, quantity, ngoNum);

                      // Navigate to the home page or another screen as needed
                      //NavigatorService.pushNamed(AppRoutes.homePageScreen);
                    } catch (e) {
                      // Handle the error (display a message, log, etc.)
                      print('Error storing donation: $e');
                    }
                    // } else {
                    //   // Handle the case where the user is not authenticated
                    //   print('User is not authenticated');
                    // }
                  } else {
                    // Handle the case where any controller is null
                    print('One or more controllers are null');
                  }
                  //onTapCompleteRequest(context);
                },
              ),
              SizedBox(height: 31.v),
              Text(
                "msg_only_registered".tr,
                style: CustomTextStyles.bodyMediumInterDeeporange600,
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildResqfoodHighR(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h, right: 21.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgResqfoodHighR,
                  height: 64.v,
                  width: 57.h,
                  onTap: () {
                    onTapImgResqfoodHighR(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13.h, top: 12.v, bottom: 10.v),
                  child: Text(
                    "msg_place_your_request".tr,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Divider(color: appTheme.gray600),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectCategory(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 7.h, right: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 25.v),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Text("lbl_select_category".tr,
                      style: theme.textTheme.titleLarge)),
              SizedBox(height: 4.v),
              BlocSelector<ReceivedRequestsBloc, ReceivedRequestsState,
                  TextEditingController?>(
                  selector: (state) => state.categoryController,
                  builder: (context, categoryController) {
                    return CustomTextFormField(
                        controller: categoryController,
                        hintText: "enter category",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.h),
                        borderDecoration:
                        TextFormFieldStyleHelper.underLineGray,
                        filled: false);
                  }),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Text("lbl_select_item".tr,
                      style: theme.textTheme.titleLarge)),
              SizedBox(height: 8.v),
              BlocSelector<ReceivedRequestsBloc, ReceivedRequestsState,
                  TextEditingController?>(
                  selector: (state) => state.itemController,
                  builder: (context, itemController) {
                    return CustomTextFormField(
                        controller: itemController,
                        hintText: "enter item to donate",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.h),
                        borderDecoration:
                        TextFormFieldStyleHelper.underLineGray,
                        filled: false);
                  }),
              // Padding(
              //     padding: EdgeInsets.only(left: 14.h),
              //     child:
              //         Text("lbl_apples".tr, style: theme.textTheme.bodyLarge)),
              SizedBox(height: 15.v),
              // Divider(),
              SizedBox(height: 18.v),
              Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Text("msg_item_description".tr,
                      style: theme.textTheme.titleLarge)),
              SizedBox(height: 9.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: BlocSelector<ReceivedRequestsBloc,
                      ReceivedRequestsState, TextEditingController?>(
                      selector: (state) => state.quantityController,
                      builder: (context, quantityController) {
                        return CustomTextFormField(
                            width: 200.h,
                            controller: quantityController,
                            hintText: "msg_enter_the_quantity".tr,
                            textInputAction: TextInputAction.done);
                      })),
              SizedBox(height: 15.v),
              Divider(),
              SizedBox(height: 15.v),
              SizedBox(
                  height: 30.v,
                  width: 183.h,
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Enter NGO number",
                            style: theme.textTheme.titleLarge)),
                    // CustomImageView(
                    //     imagePath: ImageConstant.imgPlaceMarker,
                    //     height: 30.v,
                    //     width: 50.h,
                    //     alignment: Alignment.centerLeft)
                  ])),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: BlocSelector<ReceivedRequestsBloc, ReceivedRequestsState, TextEditingController?>(
                  selector: (state) => state.ngoNumberController,
                  builder: (context, ngoNumberController) {
                    return CustomTextFormField(
                      controller: ngoNumberController,
                      hintText: "enter ngo number",
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.h),
                      borderDecoration: TextFormFieldStyleHelper.underLineGray,
                      filled: false,
                    );
                  },
                ),
              ),
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

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Categories:
        return AppRoutes.categoriesScreen;
      case BottomBarEnum.Requests:
        return "/";
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

  /// Navigates to the homePageScreen when the action is triggered.
  onTapImgResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapCompleteRequest(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
