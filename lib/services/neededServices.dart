import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/utils/navigator_service.dart';
import '../routes/app_routes.dart';

Future<void> donate(String category, String item, String quantity, String pickupLocality) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      // Get the current date and time
      DateTime now = DateTime.now();

      // Add the donation details to the "donations" collection
      await FirebaseFirestore.instance.collection("donations").add({
        'userid': user.uid,
        'category': category,
        'item': item,
        'quantity': quantity,
        'pickupLocality': pickupLocality,
        'createdAt': now,
      });

      // Add a thank you message to the "thankyou_messages" collection
      await FirebaseFirestore.instance.collection("inbox").add({
        'userid': user.uid,
        'message': 'Thank you for your donation!',
        'createdAt': now,
      });

      NavigatorService.pushNamed(AppRoutes.homePageScreen);
    } on FirebaseAuthException catch (e) {
      print("Error $e");
    } catch (e) {
      print("Error $e");
    }
  }
}
