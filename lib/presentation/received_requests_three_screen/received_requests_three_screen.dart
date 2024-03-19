import 'package:cloud_firestore/cloud_firestore.dart';

import '../categories_screen/categories_screen.dart';
import '../notifications_inbox_screen/notifications_inbox_screen.dart';
import '../profile_container_screen/profile_container_screen.dart';
import '../received_requests_three_screen/widgets/userprofile_item_widget.dart';
import '../received_requests_two_screen/received_requests_two_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/received_requests_three_bloc.dart';
import 'models/received_requests_three_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';
import 'package:ResQFood/presentation/profile_page/profile_page.dart';
import 'package:ResQFood/widgets/app_bar/appbar_subtitle.dart';
import 'package:ResQFood/widgets/app_bar/appbar_title_image.dart';
import 'package:ResQFood/widgets/app_bar/custom_app_bar.dart';
import 'package:ResQFood/widgets/custom_bottom_bar.dart';
import 'package:ResQFood/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ReceivedRequestsThreeScreen extends StatelessWidget {
  ReceivedRequestsThreeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceivedRequestsThreeBloc>(
      create: (context) => ReceivedRequestsThreeBloc(
        ReceivedRequestsThreeState(
          receivedRequestsThreeModelObj: ReceivedRequestsThreeModel(),
        ),
      )..add(ReceivedRequestsThreeInitialEvent()),
      child: ReceivedRequestsThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceivedRequestsThreeBloc, ReceivedRequestsThreeState>(
      builder: (context, state) {
        User? user = FirebaseAuth.instance.currentUser;

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 40.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.h, right: 50.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppbarTitleImage(
                              imagePath: ImageConstant.imgResqfoodHighR,
                              onTap: () {
                                onTapResqfoodHighR(context);
                              },
                            ),
                          ),
                          SizedBox(width: 6.h), // Add some spacing between the image and text
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 2.v,
                                bottom: 5.v,
                              ),
                              child: Text(
                                "Donation History".tr,
                                style: theme.textTheme.displaySmall?.copyWith(fontSize: 28.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Container(
                      margin: EdgeInsets.only(left: 7.h),
                      padding:
                      EdgeInsets.symmetric(horizontal: 4.h, vertical: 15.v),
                      decoration: AppDecoration.outlineBlack9001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: 24.h, right: 34.h),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                // ... (other widgets)
                              ],
                            ),
                          ),
                          SizedBox(height: 15.v),
                          // Divider(
                          //   color: appTheme.orangeA700,
                          //   endIndent: 6.h,
                          // ),
                          SizedBox(height: 16.v),
                          // StreamBuilder for displaying donations from "donations" collection
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("donations")
                                .where('userid', isEqualTo: user?.uid)
                                .orderBy('createdAt', descending: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (!snapshot.hasData ||
                                  snapshot.data?.docs.isEmpty == true) {
                                return Text('No donations found.');
                              }

                              List<Widget> donations = snapshot.data!.docs
                                  .map((doc) {
                                final category = doc['category'];
                                final item = doc['item'];
                                final pickupLocality = doc['pickupLocality'];
                                final quantity = doc['quantity'];
                                final createdAt =
                                doc['createdAt'] as Timestamp;

                                final dateTime = createdAt.toDate();

                                return ListTile(
                                  title: Text('Category: $category, Item: $item'),
                                  subtitle: Text(
                                    'Locality: $pickupLocality, Quantity: $quantity\nDonated on: ${dateTime.toLocal()}',
                                  ),
                                );
                              })
                                  .toList();

                              return Column(
                                children: donations,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

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

  /// Navigates to the homePageScreen when the action is triggered.
  onTapResqfoodHighR(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homePageScreen,
    );
  }
}