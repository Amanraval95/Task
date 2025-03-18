import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/homePage/homePage.dart';

import '../login/login_ui.dart';

class Wrraper extends StatefulWidget {
  const Wrraper({super.key});

  @override
  State<Wrraper> createState() => _WrraperState();
}

class _WrraperState extends State<Wrraper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return Login();
            }
          }),
    );
  }
}
