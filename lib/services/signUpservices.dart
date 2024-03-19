

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/utils/navigator_service.dart';
import '../routes/app_routes.dart';

signUpUser(String username, String userEmail, String userPass,String phone) async{
  User? userid=FirebaseAuth.instance.currentUser;
  try{
    await FirebaseFirestore.instance.collection("users")
        .doc(userid!.uid)
        .set({
      'username':username,
      'phone': phone,
      'userEmail':userEmail,
      'createdAt':DateTime.now(),
      'userId':userid.uid,
    }).then((value) =>{
      FirebaseAuth.instance.signOut(),
      NavigatorService.pushNamed(
        AppRoutes.signinScreen,
      ),
    });
  }
  on FirebaseAuthException catch(e){
    print("Error $e");
  }

}