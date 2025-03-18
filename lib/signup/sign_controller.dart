import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  /// Form key for signUp form
  final signkey = GlobalKey<FormState>();

  /// Email for signUp form
  TextEditingController EmailController = TextEditingController();

  /// Password for signUp form
  TextEditingController PasswordController = TextEditingController();

  /// This method signUp the user using Firebase
  signup() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: EmailController.text, password: PasswordController.text)
        .then((response) {
      try {
        Get.toNamed('/state');
      } catch (e) {
        print("error : $e");
      }
    });
  }
}
