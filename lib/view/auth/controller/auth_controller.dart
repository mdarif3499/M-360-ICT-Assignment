import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../util/Toast.dart';
import '../../../util/user_securce_storage.dart';
import '../../home/view/home_screen.dart';
import '../consts/consts.dart';
import '../screen/login_screen.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  TextEditingController loginEmailControler = TextEditingController();
  TextEditingController loginpassControler = TextEditingController();
  TextEditingController conPassControler = TextEditingController();
  var isReady = true.obs;
  var isloading = false.obs;
  var isVisible = true.obs;
  var profileImagePath = "".obs;
  var tableName;
  String language = "";

  UserSecureStorageImpl preference;

  AuthController(this.preference);

  Future<UserCredential?> loginMethod(context, {email, password}) async {
    UserCredential? userCredential;
    try {
      isloading(true);
      userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      isloading(false);

      toastmessage("Login  is Successful", color: Colors.blueAccent);


        Get.offAllNamed(HomeScreen.pageId);


    } on FirebaseAuthException catch (e) {
      isloading(false);
      if (e.code == 'user-not-found') {
        toastmessage(
          "No user found for that email.",
        );

        print('');
      } else if (e.code == 'wrong-password') {
        toastmessage(
          "Wrong password provided.",
        );
      } else {
        toastmessage(
          "FirebaseAuth error: ${e.code}",
        );
        print("..................${e.toString()}");
      }
    }
    return userCredential;
  }

//   loginCheck(context)async{
//
//     var name = await preference.getSecureData(SharedPrefKey.SELECTEDROLE);
// try{
//   final querySnapshot = await FirebaseFirestore.instance
//       .collection(name!)
//       .where('email', isEqualTo: "${loginEmailControler.text.trim()}")
//       .get();
//   if(querySnapshot!=null&&querySnapshot.docs.isNotEmpty){
//     loginMethod(context: context);
//     print('.....name{${name}......}....successfull');
//   }else{
//     toastmessage(
//       "You are a not ${name}",
//     );
//
//
//   }
// }on Exception catch (e){
//   toastmessage(
//     "Exception   ${e}",
//   );
// }
//
//
//   }
  //signup method
  signupMethod({context, email, password, conPassword, name, phone}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());

      print('UserCredential: $userCredential');

      storeUserData(
          name: name.toString(),
          password: password.toString(),
          email: email.toString().trim(),
          phone: phone);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastmessage("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastmessage("The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        toastmessage("The email address is not valid.");
      } else {
        toastmessage("Firebase Auth error: ${e.message}");
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  storeUserData({name, password, email, phone}) async {
    User? currentUser1 = auth.currentUser;
    try {
      DocumentReference store = await firestore.collection("user").doc();
      store.set({
        'name': name,
        'password': password,
        'email': email,
        'id': currentUser1!.uid,
        'phone_number': phone.toString(),
      }).then((value) => {
                toastmessage("Registration is Successful", color: Colors.green),
                Get.toNamed(LoginScreen.pageId)
              }

          // Observable variable

          );
    } on FirebaseAuthException catch (e) {
      toastmessage("Unexpected error: $e", color: Colors.red);

    } catch (e) {
      toastmessage("Unexpected error: $e", color: Colors.red);

      print('Unexpected error: $e');
    }
  }

//signOut method
//   void sendData() {
//     FirebaseFirestore.instance.collection('users').add({
//       'name': 'John Doe',
//       'email': 'john@example.com',
//       'created_at': FieldValue.serverTimestamp(),
//     }).then((docRef) {
//       print('Document added with ID: ${docRef.id}');
//     }).catchError((error) {
//       print('Error adding document: $error');
//     });
//   }

  clearEditingController() {
    usernameController.clear();
    emailControler.clear();
    passControler.clear();
    conPassControler.clear();
  }

  setLanguageTeacher(language, name, email) async {
    User? currentUser1 = auth.currentUser;

    DocumentReference store =
        await firestore.collection(language.toString()).doc(currentUser1!.uid);

    store.set({
      'name': name,
      'id': currentUser1!.uid,
      'language': language,
      'email': email,
    });
  }

  static void singOut() async {
    await auth.signOut();
  }
}
