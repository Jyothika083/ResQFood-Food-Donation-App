import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/utils/navigator_service.dart';
import '../routes/app_routes.dart';

donate(String category, String item, String quantity, String ngoNum) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      await FirebaseFirestore.instance.collection("receivedRequests").doc().set({
        'userid': user.uid,
        'category': category,
        'item': item,
        'quantity': quantity,
        'ngoNum': ngoNum,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)).then((value) => {
        NavigatorService.pushNamed(
          AppRoutes.homePageScreen,
        ),
      });
    } on FirebaseAuthException catch (e) {
      print("Error $e");
    } catch (e) {
      print("Error $e");
    }
  }
}
