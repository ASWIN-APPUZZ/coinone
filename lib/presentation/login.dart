import 'package:coinone/core/themes/constants.dart';
import 'package:coinone/presentation/register.dart';
import 'package:coinone/presentation/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/controller/login_controller.dart';
import 'widget/elevated_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController _signInController = Get.put(SignInController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title:),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              const Text('Welcome Back, See what you have missed!!'),
              TextFieldWidget(controller: _signInController.emailController, labelText: AppConstants().email, icon: Icons.email),
              Obx(() => TextFieldWidget(
                obscureText: _signInController.isPasswordObscured.value,
                trailingIcon: _signInController.isPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signInController.togglePasswordVisibility,
                controller: _signInController.passwordController,
                labelText: 'Password',
                icon: Icons.lock,
              )),
              const SizedBox(height: 5),
                 const SizedBox(height: 20), 
             ElevatedButtonWidget(
                text: AppConstants().signin,
                onPressed: () => _signInController.signIn(),
              ),
              TextButton(
                  onPressed: ()=> SignUpPage(),
                  child: Text(AppConstants().noacc + AppConstants().register)),
            ]),
          ),
        ));
  }
}
