import 'package:flutter/material.dart';
import 'package:ResQFood/presentation/get_started_one_screen/get_started_one_screen.dart';
import 'package:ResQFood/presentation/get_started_screen/get_started_screen.dart';
import 'package:ResQFood/presentation/get_started_two_screen/get_started_two_screen.dart';
import 'package:ResQFood/presentation/signup_screen/signup_screen.dart';
import 'package:ResQFood/presentation/signin_screen/signin_screen.dart';
import 'package:ResQFood/presentation/home_page_screen/home_page_screen.dart';
import 'package:ResQFood/presentation/categories_screen/categories_screen.dart';
import 'package:ResQFood/presentation/needed_in_categories_screen/needed_in_categories_screen.dart';
import 'package:ResQFood/presentation/profile_container_screen/profile_container_screen.dart';
import 'package:ResQFood/presentation/help_center_screen/help_center_screen.dart';
import 'package:ResQFood/presentation/about_us_screen/about_us_screen.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/received_requests_two_screen.dart';
import 'package:ResQFood/presentation/received_requests_three_screen/received_requests_three_screen.dart';
import 'package:ResQFood/presentation/received_requests_one_screen/received_requests_one_screen.dart';
import 'package:ResQFood/presentation/received_requests_screen/received_requests_screen.dart';
import 'package:ResQFood/presentation/notifications_inbox_screen/notifications_inbox_screen.dart';
import 'package:ResQFood/presentation/notifications_outbox_screen/notifications_outbox_screen.dart';
import 'package:ResQFood/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String getStartedOneScreen = '/get_started_one_screen';

  static const String getStartedScreen = '/get_started_screen';

  static const String getStartedTwoScreen = '/get_started_two_screen';

  static const String signupScreen = '/signup_screen';

  static const String signinScreen = '/signin_screen';

  static const String homePageScreen = '/home_page_screen';

  static const String categoriesScreen = '/categories_screen';

  static const String neededInCategoriesScreen = '/needed_in_categories_screen';

  static const String profilePage = '/profile_page';

  static const String profileContainerScreen = '/profile_container_screen';

  static const String helpCenterScreen = '/help_center_screen';

  static const String aboutUsScreen = '/about_us_screen';

  static const String receivedRequestsTwoScreen =
      '/received_requests_two_screen';

  static const String receivedRequestsThreeScreen =
      '/received_requests_three_screen';

  static const String receivedRequestsOneScreen =
      '/received_requests_one_screen';

  static const String receivedRequestsScreen = '/received_requests_screen';

  static const String notificationsInboxScreen = '/notifications_inbox_screen';

  static const String notificationsOutboxScreen =
      '/notifications_outbox_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        getStartedOneScreen: GetStartedOneScreen.builder,
        getStartedScreen: GetStartedScreen.builder,
        getStartedTwoScreen: GetStartedTwoScreen.builder,
        signupScreen: SignupScreen.builder,
        signinScreen: SigninScreen.builder,
        homePageScreen: HomePageScreen.builder,
        categoriesScreen: CategoriesScreen.builder,
        neededInCategoriesScreen: NeededInCategoriesScreen.builder,
        profileContainerScreen: ProfileContainerScreen.builder,
        helpCenterScreen: HelpCenterScreen.builder,
        aboutUsScreen: AboutUsScreen.builder,
        receivedRequestsTwoScreen: ReceivedRequestsTwoScreen.builder,
        receivedRequestsThreeScreen: ReceivedRequestsThreeScreen.builder,
        receivedRequestsOneScreen: ReceivedRequestsOneScreen.builder,
        receivedRequestsScreen: ReceivedRequestsScreen.builder,
        notificationsInboxScreen: NotificationsInboxScreen.builder,
        notificationsOutboxScreen: NotificationsOutboxScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: GetStartedOneScreen.builder
      };
}
