import 'package:firebase_auth/firebase_auth.dart';

import 'bloc/signin_bloc.dart';
import 'models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/core/utils/validation_functions.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';
import 'package:ResQFood/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SigninBloc>(
        create: (context) =>
            SigninBloc(SigninState(signinModelObj: SigninModel()))
              ..add(SigninInitialEvent()),
        child: SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.green50,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 36.h, top: 64.v, right: 36.h),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgResqfoodHighR,
                          height: 242.v,
                          width: 215.h),
                      SizedBox(height: 17.v),
                      Text("lbl_welcome_back".tr,
                          style: theme.textTheme.displayLarge),
                      SizedBox(height: 29.v),
                      BlocSelector<SigninBloc, SigninState,
                              TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailController) {
                            return CustomTextFormField(
                                controller: emailController,
                                hintText: "msg_enter_your_email".tr,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email_mobile_number"
                                        .tr;
                                  }
                                  return null;
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 15.v),
                                borderDecoration: TextFormFieldStyleHelper
                                    .outlineSecondaryContainer);
                          }),
                      SizedBox(height: 11.v),
                      // Text("lbl_or".tr, style: theme.textTheme.titleLarge),
                      SizedBox(height: 14.v),
                      BlocSelector<SigninBloc, SigninState,
                              TextEditingController?>(
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
                                //     return "err_msg_please_enter_valid_password"
                                //         .tr;
                                //   }
                                //   return null;
                                // },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.h, vertical: 19.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.outlineBlack);
                          }),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                          width: 169.h,
                          text: "lbl_sign_in2".tr,
                          rightIcon: Container(
                              margin: EdgeInsets.only(left: 7.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgMakiarrow,
                                  height: 20.v,
                                  width: 32.h)),
                          buttonStyle: CustomButtonStyles.fillDeepOrange,
                          buttonTextStyle: CustomTextStyles
                              .headlineSmallOnSecondaryContainer,
                          onPressed: () async{
                            var emailController = context.read<SigninBloc>().state.emailController;
                            var passwordController = context.read<SigninBloc>().state.passwordController;
                            if (emailController != null && passwordController != null) {

                              var loginEmail = emailController.text.trim();
                              var loginPass = passwordController.text.trim();
                              try{
                                final UserCredential userCredential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(email: loginEmail, password: loginPass);
                                final User? firebaseUser = userCredential.user;
                                if(firebaseUser!= null){
                                  NavigatorService.pushNamed(
                                    AppRoutes.homePageScreen,
                                  );
                                }
                                else
                                  {
                                    print("check email and password");
                                  }
                              }on
                              FirebaseAuthException catch(e){
                                print("Error $e");
                              }

                            } else {
                              // Handle the case where either controller is null
                              print('Email or password controller is null');
                            }
                            // onTapSignIn(context);
                          }),
                      SizedBox(height: 10.v),
                      TextButton(
                        onPressed: () {
                          // Navigate to the signup screen when the signup button is pressed
                          NavigatorService.pushNamed(AppRoutes.signupScreen);
                        },
                        child: Text(
                          "Don't have an account?Sign up",
                          style: TextStyle(

                            color: Colors.orange, // Change color as needed
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ])))));
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}
