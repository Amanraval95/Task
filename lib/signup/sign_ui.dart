import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/signup/sign_controller.dart';

class SignUi extends StatelessWidget {
  const SignUi({super.key});

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
              child: GetBuilder<SignUpController>(
                  init: SignUpController(),
                  builder: (signupController) {
                    return Form(
                      key: signupController.signkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // TextFormField(
                          //   cursorColor: Colors.black38,
                          //   decoration: const InputDecoration(
                          //       hintText: "Enter Username",
                          //       labelText: "UserName",
                          //       labelStyle: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 19,
                          //           color: Colors.black),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.black))),
                          // ),
                          // const SizedBox(height: 30),
                          Text(
                            "SignUp",
                            style: TextStyle(fontSize: 27),
                          ),
                          TextFormField(
                            controller: signupController.EmailController,
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
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: signupController.PasswordController,
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
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () => signupController.signup(),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black),
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
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
