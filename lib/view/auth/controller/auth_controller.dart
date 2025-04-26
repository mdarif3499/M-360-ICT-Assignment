import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../util/Toast.dart';
import '../../../util/user_securce_storage.dart';
import '../../../widget/dialog_builder.dart';
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

  var tableName;
  String language = "";

  UserSecureStorageImpl preference;

  AuthController(this.preference);

  Future<UserCredential?> loginMethod(context, {email, password}) async {
    DialogBuilder(context).showLoadingIndicator();

    UserCredential? userCredential;
    try {

      userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password);


      toastmessage("Login  is Successful", color: Colors.blueAccent);

      DialogBuilder(context).hideOpenDialog();

        Get.offAllNamed(HomeScreen.pageId);


    } on FirebaseAuthException catch (e) {

      DialogBuilder(context).hideOpenDialog();

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
  }


  signupMethod({context, email, password, conPassword, name, phone}) async {
    UserCredential? userCredential;
    DialogBuilder(context).showLoadingIndicator();

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());

      print('UserCredential: $userCredential');

      storeUserData(
          name: name.toString(),
          password: password.toString(),
          email: email.toString().trim(),
          phone: phone);
      DialogBuilder(context).hideOpenDialog();

    } on FirebaseAuthException catch (e) {
      DialogBuilder(context).hideOpenDialog();

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
      DialogBuilder(context).hideOpenDialog();

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


  clearEditingController() {
    usernameController.clear();
    emailControler.clear();
    passControler.clear();
    conPassControler.clear();
  }


  static void singOut() async {
    await auth.signOut();
  }
}
