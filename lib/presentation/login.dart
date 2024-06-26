import 'package:coinone/core/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signInPage extends StatefulWidget {
  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadUserCredentials();
  }

  _loadUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        email = prefs.getString('email') ?? '';
        password = prefs.getString('password') ?? '';
      }
    });
  }

  _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (rememberMe) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('rememberMe', true);
        prefs.setString('email', email);
        prefs.setString('password', password);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('rememberMe', false);
        prefs.remove('email');
        prefs.remove('password');
      }
      // Navigate to home page
    } catch (e) {
      print(e);
    }
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
                onChanged: (value) {
                  email = value;
                },
                controller: TextEditingController(text: email),
                decoration: InputDecoration(
                  hintText: AppConstants().email,
                )),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                controller: TextEditingController(text: password),
                decoration: InputDecoration(
                  hintText: AppConstants().pwd,
                )),
            Row(children: <Widget>[
              Checkbox(
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue!;
                    });
                  }),
              Text(AppConstants().remember)
            ]),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _signIn, child: Text(AppConstants().signin)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(AppConstants().noacc + AppConstants().signup)),
          ]),
        ));
  }
}
