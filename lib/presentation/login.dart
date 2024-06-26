import 'package:coinone/core/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  hintText: AppConstants().email,
                )),
            TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: AppConstants().pwd,
                )),
            const SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot');
                },
                child: Text(AppConstants().forgot)),
               const SizedBox(height: 20), 
            ElevatedButton(
                onPressed: signIn, child: Text(AppConstants().signin)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(AppConstants().noacc + AppConstants().signup)),
                
          ]),
        ));
  }
}
