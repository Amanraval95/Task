import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /// Form key for login form
  final LoginFormkey = GlobalKey<FormState>();

  /// Email for login form
  TextEditingController emailController = TextEditingController();

  /// Password for login form
  TextEditingController passwordController = TextEditingController();

  ///FocusNode for Password field
  // final FocusNode PasswordFocus = FocusNode();

  // void checkEmailInput(String value) {
  //   if (value.endsWith("@gmail.com")) {
  //     FocusScope.of(Get.context!).requestFocus(PasswordFocus);
  //   }
  // }

  /// This method logs in the user using Firebase
  login() async {
    // TextEditingController passwordController = TextEditingController();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((response) {
      // Login
      emailController.clear();
      passwordController.clear();
      Get.toNamed('homepage');
    });
  }
}
