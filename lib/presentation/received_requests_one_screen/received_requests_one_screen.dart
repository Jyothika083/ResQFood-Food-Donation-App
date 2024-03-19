import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';

import 'bloc/received_requests_one_bloc.dart';
import 'models/received_requests_one_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/core/utils/validation_functions.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:ResQFood/widgets/custom_text_form_field.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsOneScreen extends StatelessWidget {
  ReceivedRequestsOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsOneBloc>(
        create: (context) => ReceivedRequestsOneBloc(ReceivedRequestsOneState(
            receivedRequestsOneModelObj: ReceivedRequestsOneModel()))
          ..add(ReceivedRequestsOneInitialEvent()),
        child: ReceivedRequestsOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 34.v),
                    child: Column(children: [
                      SizedBox(height: 6.v),
                      _buildResqfoodHighR(context),
                      SizedBox(height: 35.v),
                      _buildNgoName(context),
                      SizedBox(height: 39.v),
                      _buildNgoNumber(context),
                      SizedBox(height: 63.v),
                      CustomElevatedButton(
                          width: 158.h,
                          text: "lbl_verify".tr,
                          margin: EdgeInsets.only(left: 99.h),
                          buttonStyle: CustomButtonStyles.fillOrangeA,
                          onPressed: () {
                            onTapVerify(context);
                          },
                          alignment: Alignment.centerLeft),
                      Spacer(),
                      Text("msg_only_registered".tr,
                          style: CustomTextStyles.bodyMediumInterDeeporange600)
                    ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildResqfoodHighR(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h, right: 21.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    height: 64.v,
                    width: 57.h,
                    onTap: () {
                      onTapImgResqfoodHighR(context);
                    }),
                Padding(
                    padding:
                        EdgeInsets.only(left: 13.h, top: 12.v, bottom: 10.v),
                    child: Text("msg_place_your_request".tr,
                        style: theme.textTheme.headlineLarge))
              ])),
          SizedBox(height: 9.v),

        ]));
  }

  /// Section Widget
  Widget _buildNgoName(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Text("lbl_ngo_name".tr,
                  style: CustomTextStyles.headlineSmallInter)),
          SizedBox(height: 12.v),
          Padding(
              padding: EdgeInsets.only(right: 46.h),
              child: BlocSelector<ReceivedRequestsOneBloc,
                      ReceivedRequestsOneState, TextEditingController?>(
                  selector: (state) => state.nameController,
                  builder: (context, nameController) {
                    return CustomTextFormField(
                        controller: nameController,
                        hintText: "msg_enter_the_registered".tr,
                        // validator: (value) {
                        //   if (!isText(value)) {
                        //     return "err_msg_please_enter_valid_text".tr;
                        //   }
                        //   return null;
                        // }
                        );
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildNgoNumber(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_ngo_number".tr, style: CustomTextStyles.headlineSmallInter),
          SizedBox(height: 21.v),
          Padding(
              padding: EdgeInsets.only(right: 46.h),
              child: BlocSelector<ReceivedRequestsOneBloc,
                      ReceivedRequestsOneState, TextEditingController?>(
                  selector: (state) => state.nameController1,
                  builder: (context, nameController1) {
                    return CustomTextFormField(
                        controller: nameController1,
                        hintText: "msg_enter_ngo_registered".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        // validator: (value) {
                        //   if (!isNumeric(value)) {
                        //     return "err_msg_please_enter_valid_number".tr;
                        //   }
                        //   return null;
                        // }
                        );
                  }))
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

  /// Navigates to the receivedRequestsScreen when the action is triggered.
  onTapVerify(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = BlocProvider.of<ReceivedRequestsOneBloc>(context).state.nameController!.text.trim();
      final ngoNumber = BlocProvider.of<ReceivedRequestsOneBloc>(context).state.nameController1!.text.trim();

      // Reference to your Firestore collection
      final collectionReference = FirebaseFirestore.instance.collection('ngo');

      // Perform a query to check if the name and ngoNumber exist in the collection
      final querySnapshot = await collectionReference
          .where('name', isEqualTo: name)
          .where('ngoNum', isEqualTo: ngoNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Data is valid, navigate to the next screen
        // final currentRoute = getCurrentRoute(BottomBarEnum.Requests);
        // if (currentRoute != null) {
        //   Navigator.of(context).pushNamed(currentRoute);
        // }
        NavigatorService.pushNamed(
          AppRoutes.receivedRequestsScreen,
        );
      } else {
        // Show an error message or handle the case where the data is not valid
        print("Invalid NGO name or number. Please try again.");
      }
    }
  }
}
