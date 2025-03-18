import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/homePage/homePage.dart';
import 'package:task/pages/wrraper.dart';
import 'package:task/signup/sign_ui.dart';
import 'package:task/theme.dart';

import 'login/login_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  var lightColorTheme = MaterialTheme.lightScheme();
  var darkColorTheme = MaterialTheme.darkScheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(colorScheme: lightColorTheme),
      darkTheme: ThemeData(colorScheme: darkColorTheme),
      debugShowCheckedModeBanner: false,
      initialRoute: '/state',
      getPages: [
        // GetPage(name: "/loginOld", page: () => Loginpage()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/signup", page: () => SignUi()),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(name: "/state", page: () => Wrraper()),
      ],
    );
  }
}
