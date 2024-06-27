import 'package:coinone/presentation/widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/themes/constants.dart';
import '../domain/controller/register_controller.dart';
import 'widget/text_field_widget.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
  SignUpPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(AppConstants().signup)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: <Widget>[
              const Text('Welcome! Register here to join with us..'),
              TextFieldWidget(controller: _signUpController.emailController, labelText: AppConstants().email, icon: Icons.email),
              const SizedBox(height: 20),
               Obx(() => TextFieldWidget(
                controller: _signUpController.passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: _signUpController.isPasswordObscured.value,
                trailingIcon: _signUpController.isPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signUpController.togglePasswordVisibility,
              )),
              const SizedBox(height: 20),
             Obx(() => TextFieldWidget(
                controller: _signUpController.confirmPasswordController,
                labelText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: _signUpController.isConfirmPasswordObscured.value,
                trailingIcon: _signUpController.isConfirmPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signUpController.toggleConfirmPasswordVisibility,
              )),
              const SizedBox(height: 20),
              ElevatedButtonWidget(text: AppConstants().signup, onPressed: ()=>_signUpController.signUp(context)),
              TextButton(
                  onPressed: () => SignUpPage(),
                  child: Text(AppConstants().already + AppConstants().signup)),
            ]),
          ),
        ));
  }
}
