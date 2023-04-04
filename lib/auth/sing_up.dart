import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../resources/resources.dart';
import '../screens/reuse_widget/loading.dart';
import '../screens/reuse_widget/snack_bar.dart';

class Signup {
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();

  void signUP(
      BuildContext context,
      TextEditingController textEmailCtrl,
      TextEditingController textPassCtrl,
      TextEditingController textUserNameCtrl) async {
    final notExist = bar.snack(StringManager.noAccount,ColorManager.redColor);
    debugPrint("Button pressed");
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: Loading());
        });
    final userData = <String, String>{
      "UserName": textUserNameCtrl.text.trim(),
      "Email": textEmailCtrl.text.trim(),
      "Password": textPassCtrl.text.trim()
    };
    try {
      await db
          .collection("Users")
          .doc(textEmailCtrl.text.trim())
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
              .doc(textEmailCtrl.text.toString().trim())
              .set(userData)
              .then((value) async {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: textEmailCtrl.text.trim(),
                password: textPassCtrl.text.trim());
            Get.offAll(MainScreen());
          });
        }
      });
    } catch (Exception) {
      debugPrint("Failed to sign up");
    }
  }
}
