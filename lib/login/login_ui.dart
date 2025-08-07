import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/login/login_controller.dart';
import 'package:task/signup/sign_ui.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                color: Colors.white.withAlpha(235),
              ),
              child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (loginController) {
                    return Form(
                      key: loginController.LoginFormkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(fontSize: 27),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: loginController.emailController,
                            cursorColor: Colors.black38,
                            decoration: const InputDecoration(
                                hintText: "Enter E-mail",
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            // onChanged: loginController.checkEmailInput,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            obscureText: true,
                            controller: loginController.passwordController,
                            // focusNode: loginController.PasswordFocus,
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
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () => loginController.login(),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUi()));
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      fontSize: 17,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
