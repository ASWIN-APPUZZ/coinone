import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/firebase_options.dart';
import '../../presentation/home_page.dart';
import '../../presentation/widget/snackbar_widget.dart';

class SignUpController extends GetxController {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isPasswordObscured = true.obs;
  var isConfirmPasswordObscured = true.obs;

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured.value = !isConfirmPasswordObscured.value;
  }

  Future<void> signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (!isValidEmail(email)) {
      SnackbarWidget.showSnackbar(
        "Invalid Email",
        "Please enter a valid email address.",
      );
      return;
    }

    if (!isValidPassword(password)) {
      SnackbarWidget.showSnackbar(
        "Weak Password",
        "Password must be at least 8 characters long.",
      );
      return;
    }

    if (password != confirmPassword) {
      SnackbarWidget.showSnackbar(
        "Password Mismatch",
        "Please enter matching passwords.",
      );
      return;
    }

    var user = await _authService.registerWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      Get.offAll(HomePage());
    } else {
      SnackbarWidget.showSnackbar(
        "Sign Up Failed",
        "Please try again.",
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}