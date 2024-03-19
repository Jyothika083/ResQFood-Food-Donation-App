import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';
import 'bloc/needed_in_categories_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/neededServices.dart';
import 'models/needed_in_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title_image.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:ResQFood/widgets/custom_text_form_field.dart';


// ignore_for_file: must_be_immutable
class NeededInCategoriesScreen extends StatelessWidget {
  NeededInCategoriesScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<NeededInCategoriesBloc>(
        create: (context) => NeededInCategoriesBloc(NeededInCategoriesState(
            neededInCategoriesModelObj: NeededInCategoriesModel()))
          ..add(NeededInCategoriesInitialEvent()),
        child: NeededInCategoriesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 12.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_let_s_donate".tr,
                          style: CustomTextStyles.headlineLargeGreen900)),
                  SizedBox(height: 38.v),
                  _buildTwo(context),
                  SizedBox(height: 44.v),
                  CustomElevatedButton(
                      width: 158.h,
                      text: "lbl_donate".tr,
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                      onPressed: () async{
                        var categoryController = context.read<NeededInCategoriesBloc>().state.categoryController;
                        var itemController = context.read<NeededInCategoriesBloc>().state.itemController;
                        var enterQuantityController = context.read<NeededInCategoriesBloc>().state.enterQuantityController;
                        var pickupLocalityController = context.read<NeededInCategoriesBloc>().state.pickupLocalityController;
                        if (categoryController != null && itemController != null && enterQuantityController != null && pickupLocalityController != null) {
                          var category = categoryController.text.trim();
                          var item = itemController.text.trim();
                          var quantity = enterQuantityController.text.trim();
                          var pickupLocality = pickupLocalityController.text.trim();

                          // Retrieve the current user ID
                          // var userId = FirebaseAuth.instance.currentUser?.uid;
                          //
                          // if (userId != null) {
                            try {
                              // Store the donation information
                              await donate(category, item, quantity, pickupLocality);

                              // Navigate to the home page or another screen as needed
                              NavigatorService.pushNamed(AppRoutes.homePageScreen);
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
                        //onTapDonate(context);
                      }),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 123.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 13.h, right: 159.h),
              child: Row(children: [
                AppbarTitleImage(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    onTap: () {
                      onTapResqfoodHighR(context);
                    }),
                AppbarTitle(
                    text: "lbl_needed".tr,
                    margin: EdgeInsets.only(left: 20.h, top: 6.v, bottom: 11.v))
              ])),
          SizedBox(height: 14.v),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 378.h))
        ]),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
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
              BlocSelector<NeededInCategoriesBloc, NeededInCategoriesState,
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
              BlocSelector<NeededInCategoriesBloc, NeededInCategoriesState,
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
                  child: BlocSelector<NeededInCategoriesBloc,
                          NeededInCategoriesState, TextEditingController?>(
                      selector: (state) => state.enterQuantityController,
                      builder: (context, enterQuantityController) {
                        return CustomTextFormField(
                            width: 200.h,
                            controller: enterQuantityController,
                            hintText: "msg_enter_the_quantity".tr,
                            textInputAction: TextInputAction.done);
                      })),
              SizedBox(height: 25.v),
              Divider(),
              SizedBox(height: 15.v),
              SizedBox(
                  height: 30.v,
                  width: 183.h,
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text("lbl_pickup_locality".tr,
                            style: theme.textTheme.titleLarge)),
                    CustomImageView(
                        imagePath: ImageConstant.imgPlaceMarker,
                        height: 30.v,
                        width: 50.h,
                        alignment: Alignment.centerLeft)
                  ])),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: BlocSelector<NeededInCategoriesBloc, NeededInCategoriesState, TextEditingController?>(
                  selector: (state) => state.pickupLocalityController,
                  builder: (context, pickupLocalityController) {
                    return CustomTextFormField(
                      controller: pickupLocalityController,
                      hintText: "enter pickup locality",
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
  onTapDonate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
