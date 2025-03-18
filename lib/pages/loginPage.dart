import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/bg fruit.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    cursorColor: Colors.black38,
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "UserName",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: email,
                    cursorColor: Colors.black38,
                    decoration: const InputDecoration(
                        hintText: "Enter E-mail",
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: " Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => signIn,
                    child: Text("Login"),
                    style: ButtonStyle(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
