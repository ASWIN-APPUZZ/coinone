import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/firebase_options.dart';
import '../../presentation/home_page.dart';
import '../../presentation/widget/snackbar_widget.dart';

class SignInController extends GetxController {
  final AuthService _authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordObscured = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!isValidEmail(email)) {
      SnackbarWidget.showSnackbar(
        "Invalid Email",
        "Please enter a valid email address.",
      );
      return;
    }

    if (!isValidPassword(password)) {
      SnackbarWidget.showSnackbar(
        "Invalid Password",
        "Enter valid Password.",
      );
      return;
    }

    var user = await _authService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      Get.offAll(HomePage());
    } else {
      SnackbarWidget.showSnackbar(
        "Sign In Failed",
        "Please check your credentials and try again.",
      );
    }
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
  }
}