import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';

import 'package:flutter/material.dart';

class Signup {
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();

  void signUP(
      BuildContext context,
      TextEditingController textEmailCtrl,
      TextEditingController textPassCtrl,
      TextEditingController textUserNameCtrl) async {
    final notExist = bar.snack("Account already exist");
    debugPrint("Button pressed");
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: Loading());
        });
    final userData = <String, dynamic>{
      "UserName": textUserNameCtrl.text,
      "Email": textEmailCtrl.text,
      "Password": textPassCtrl.text
    };
    try {
      await db
          .collection("Users")
          .doc(textEmailCtrl.text.toString())
          .get()
          .then((value) {
        if (value.exists) {
          debugPrint(value["Email"]);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(notExist);
        } else {
          debugPrint("No email");
          db
              .collection("Users")
              .doc(textEmailCtrl.text.toString())
              .set(userData)
              .then((value) {
            Get.offAll( HomeScreen());
          });
        }
      });
    } catch (Exception) {
      debugPrint("Failed to sign up");
    }
  }
}
