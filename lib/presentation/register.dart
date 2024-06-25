import 'package:flutter/material.dart';

class RregisterPAge extends StatelessWidget {
  const RregisterPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: const Text(
                    'Register New User',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ) //
                  )
            ],
          ),
        ),
      )),
    );
  }
}
