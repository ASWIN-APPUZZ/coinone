import 'package:coinone/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/themes/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(const Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(AppConstants().signup)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: <Widget>[
              const Text('Welcome! Register here to join with us..'),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: AppConstants().email,
                    suffixIcon: const Icon(Icons.email)
                  )),
              TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: AppConstants().pwd,
                    suffixIcon: const Icon(Icons.lock)
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: signUp, child: Text(AppConstants().signup)),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(AppConstants().already + AppConstants().signup)),
            ]),
          ),
        ));
  }
}
