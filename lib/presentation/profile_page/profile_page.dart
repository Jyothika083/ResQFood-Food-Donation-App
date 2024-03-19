import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'models/profile_item_model.dart';
import 'models/profile_model.dart';
import 'bloc/profile_bloc.dart';
import '../profile_page/widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
        ..add(ProfileInitialEvent()),
      child: ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillPrimary,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 27.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgResqfoodHighR,
                    height: 64.v,
                    width: 57.h,
                    margin: EdgeInsets.only(left: 15.h),
                    onTap: () {
                      onTapImgResqfoodHighR(context);
                    },
                  ),
                  SizedBox(height: 10.v),
                  _buildProfileInfo(user),
                  SizedBox(height: 12.v),
                  GestureDetector(
                    onTap: () {
                      onTapDonationHistory(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.h),
                      child: Text(
                        "msg_donation_history".tr,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.headlineLarge30.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Divider(
                    color: appTheme.orangeA700,
                    endIndent: 7.h,
                  ),
                  SizedBox(height: 5.v),
                  _buildRewardsSection(context),
                  SizedBox(height: 92.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgMdiAbout,
                          height: 36.adaptSize,
                          width: 36.adaptSize,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapTxtAboutUs(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h, bottom: 2.v),
                            child: Text(
                              "lbl_about_us".tr,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgClarityHelpSolid,
                          height: 36.adaptSize,
                          width: 36.adaptSize,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapTxtHelpCentre(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 11.h, top: 2.v),
                            child: Text(
                              "lbl_help_centre".tr,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgIcRoundShare,
                          height: 31.v,
                          width: 35.h,
                          margin: EdgeInsets.only(bottom: 3.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text(
                            "lbl_share_the_app".tr,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLogout,
                          height: 36.adaptSize,
                          width: 36.adaptSize,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapLogout(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h, bottom: 2.v),
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildRewardsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Text(
              "lbl_rewards".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.headlineLarge30,
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            height: 110.v,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: BlocSelector<ProfileBloc, ProfileState, ProfileModel?>(
              selector: (state) => state.profileModelObj,
              builder: (context, profileModelObj) {
                return ListView.separated(
                  padding: EdgeInsets.only(left: 1.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 379.0.h,
                      // child: Divider(
                      //   height: 1.v,
                      //   thickness: 1.v,
                      //   color: appTheme.orangeA700,
                      //   indent: 0.5.h,
                      //   endIndent: 0.5.h,
                      // ),
                    );
                  },
                  itemCount: profileModelObj?.profileItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ProfileItemModel model =
                        profileModelObj?.profileItemList[index] ??
                            ProfileItemModel();
                    return ProfileItemWidget(model);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProfileInfo(User? user) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('users').where('userEmail', isEqualTo: user?.email).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError || snapshot.data!.docs.isEmpty ?? true) {
          return Text("Error fetching user information");
        }

        var userData = snapshot.data?.docs[0].data() as Map<String, dynamic>;

        // Extract username field (replace 'username' with actual field name)
        String username = userData['username'] ?? "Default Username";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse6,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(20.h),
                    margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Text(
                      username,
                      style: CustomTextStyles.displaySmallDeeporange600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Text(
                "lbl_email_id".tr,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 15.v),
            Divider(
              color: appTheme.orangeA700,
              endIndent: 7.h,
            ),
            SizedBox(height: 6.v),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                user?.email ?? "user@example.com",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ],
        );
      },
    );
  }

  onTapImgResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.homePageScreen);
  }

  onTapTxtAboutUs(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.aboutUsScreen);
  }

  onTapTxtHelpCentre(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.helpCenterScreen);
  }
  onTapDonationHistory(BuildContext context){
    NavigatorService.pushNamed(AppRoutes.receivedRequestsThreeScreen);
  }

  onTapLogout(BuildContext context) {
    // Implement the logic to sign out the user
    // For Firebase authentication, you can use FirebaseAuth.instance.signOut();
    // Add your authentication provider's sign-out logic here
    FirebaseAuth.instance.signOut();

    // Navigate to the login or home page after logout
    NavigatorService.pushNamed(AppRoutes.signinScreen);  // Change to the appropriate route for your login screen
  }
}
