import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/signUpservices.dart';
import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/core/utils/validation_functions.dart';
import 'package:ResQFood/widgets/custom_checkbox_button.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:ResQFood/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.green50,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 36.h, top: 64.v, right: 36.h),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    height: 242.v,
                    width: 215.h,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "lbl_welcome".tr,
                    style: CustomTextStyles.displayLarge64,
                  ),
                  SizedBox(height: 26.v),
                  BlocSelector<SignupBloc, SignupState, TextEditingController?>(
                    selector: (state) => state.emailController,
                    builder: (context, emailController) {
                      return CustomTextFormField(
                        controller: emailController,
                        hintText: "msg_enter_your_email".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 15.v),
                        borderDecoration:
                        TextFormFieldStyleHelper.outlineSecondaryContainer,
                      );
                    },
                  ),
                  SizedBox(height: 11.v),
                  BlocSelector<SignupBloc, SignupState, TextEditingController?>(
                    selector: (state) => state.usernameController,
                    builder: (context, usernameController) {
                      return CustomTextFormField(
                        controller: usernameController,
                        hintText: "Enter your username",
                        textInputType: TextInputType.text,
                        validator: (value) {
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 15.v),
                        borderDecoration:
                        TextFormFieldStyleHelper.outlineSecondaryContainer,
                      );
                    },
                  ),
                  SizedBox(height: 14.v),
                  BlocSelector<SignupBloc, SignupState, TextEditingController?>(
                    selector: (state) => state.phoneController,
                    builder: (context, phoneController) {
                      return CustomTextFormField(
                        controller: phoneController,
                        hintText: "Enter your mobile number",
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          return null;
                        },
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 19.v),
                        borderDecoration:
                        TextFormFieldStyleHelper.outlineBlack,
                      );
                    },
                  ),
                  _buildLoginForm(context),
                  SizedBox(height: 28.v),
                  _buildTermsAndConditionsCheckbox(context),
                  SizedBox(height: 26.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean(context);
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "msg_already_have_an2".tr,
                              style: theme.textTheme.titleLarge),
                          TextSpan(
                              text: "lbl_sign_in".tr,
                              style: CustomTextStyles.titleLargeDeeporange500)
                        ]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 26.v),
                  CustomElevatedButton(
                    width: 169.h,
                    text: "lbl_sign_up".tr,
                    rightIcon: Container(
                      margin: EdgeInsets.only(left: 2.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgMakiarrow,
                        height: 20.v,
                        width: 32.h,
                      ),
                    ),
                    buttonStyle: CustomButtonStyles.fillDeepOrange,
                    buttonTextStyle:
                    CustomTextStyles.headlineSmallOnSecondaryContainer,
                    onPressed: () async {
                      var emailController =
                          context.read<SignupBloc>().state.emailController;
                      var passwordController =
                          context.read<SignupBloc>().state.passwordController;
                      var usernameController =
                          context.read<SignupBloc>().state.usernameController;
                      var phoneController =
                          context.read<SignupBloc>().state.phoneController;
                      if (emailController != null &&
                          passwordController != null &&
                          usernameController != null &&
                          phoneController != null) {
                        var username = usernameController.text.trim();
                        var userEmail = emailController.text.trim();
                        var userPass = passwordController.text.trim();
                        var phone = phoneController.text.trim();

                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: userEmail, password: userPass)
                            .then((value) => {
                          log("user created"),
                          signUpUser(username, userEmail, userPass, phone),
                        });
                      } else {
                        print('Email or password controller is null');
                      }
                    },
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Column(children: [
      // Text("lbl_or".tr, style: theme.textTheme.titleLarge),
      SizedBox(height: 14.v),
      BlocSelector<SignupBloc, SignupState, TextEditingController?>(
          selector: (state) => state.passwordController,
          builder: (context, passwordController) {
            return CustomTextFormField(
                controller: passwordController,
                hintText: "Enter your password",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                // validator: (value) {
                //   if (!isValidPhone(value)) {
                //     return "err_msg_please_enter_valid_password".tr;
                //   }
                //   return null;
                // },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.h, vertical: 19.v),
                borderDecoration: TextFormFieldStyleHelper.outlineBlack);
          })
    ]);
  }

  /// Section Widget
  Widget _buildTermsAndConditionsCheckbox(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 20.h, right: 61.h),
            child: BlocSelector<SignupBloc, SignupState, bool?>(
                selector: (state) => state.termsAndConditionsCheckbox,
                builder: (context, termsAndConditionsCheckbox) {
                  return CustomCheckboxButton(
                      alignment: Alignment.centerLeft,
                      text: "msg_terms_and_conditions".tr,
                      value: termsAndConditionsCheckbox,
                      onChange: (value) {
                        context
                            .read<SignupBloc>()
                            .add(ChangeCheckBoxEvent(value: value));
                      }

                      );
                })));
  }

  /// Navigates to the signinScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signinScreen,
    );
  }

  /// Navigates to the homePageScreen when the action is triggered.
  // onTapSignUp(BuildContext context) {
  //   NavigatorService.pushNamed(
  //     AppRoutes.signinScreen,
  //   );
  // }
}
