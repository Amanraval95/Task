import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/wrraper.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _AlertDilougeOnLogout(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text("Confirm Logout !"),
              content: Text("Are You Sure ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("NO")),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await FirebaseAuth.instance.signOut().then((user) {
                      try {
                        Get.offAll(() => Wrraper());
                      } catch (e) {
                        print("$e");
                      }
                    });
                  },
                  child: Text("YES"),
                )
              ],
            );
          });
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text("drawer")),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () async {
              _AlertDilougeOnLogout(context);
            },
          )
        ],
      ),
    );
  }
}
