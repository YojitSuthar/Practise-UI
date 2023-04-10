export 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/reuse_widget/loading.dart';
import '../screens/reuse_widget/snack_bar.dart';

class Signin {
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();
  final userPreferences = UserPreferences();

  void signIN(BuildContext context, TextEditingController textEmailCtrl,
      TextEditingController textPassCtrl) async {
    debugPrint("Button pressed");
    final invalidCredentials =
        bar.snack(StringManager.invalidCredentials, ColorManager.redColor);
    final notExist = bar.snack(StringManager.noAccount, ColorManager.redColor);

    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: Loading());
        });
    try {
      await db
          .collection("Users")
          .doc(textEmailCtrl.text.trim())
          .get()
          .then((value) async {
            debugPrint("Enter");
            print(textEmailCtrl.text.trim());
        if (value["Email"] == textEmailCtrl.text.trim()) {
          debugPrint(value["Email"]);
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: textEmailCtrl.text.trim(),
                  password: textPassCtrl.text.trim())
              .then((value) {
                print("asdasdasdadasd");
            userPreferences.saveLoginUserInfo(
                textEmailCtrl.text, textPassCtrl.text);
            Get.offAll( MainScreen());
          });
        }
        else {
          debugPrint("invalid credentials");
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(invalidCredentials);
        }
      });
    } catch (Exception) {
      debugPrint("Account Does not exists");
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(invalidCredentials);
    }
  }
}
