import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import '../screens/reuse_widget/loading.dart';
import '../screens/reuse_widget/snack_bar.dart';

class Signin{
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();
  final userPreferences=UserPreferences();
  void signIN(BuildContext context,TextEditingController textEmailCtrl,
      TextEditingController textPassCtrl) async {
    debugPrint("Button pressed");
    final invalidCredentials = bar.snack(StringManager.InvalidCredentials);
    final notExist = bar.snack(StringManager.no_Account);

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
          .then((value) {
        if (value["Email"] == textEmailCtrl.text.trim() &&
            value["Password"] == textPassCtrl.text.trim()) {
          userPreferences.saveLoginUserInfo(textEmailCtrl.text,textPassCtrl.text);
          Get.offAll(MainScreen());
        } else {
          debugPrint("invalid credentials");
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(invalidCredentials);
        }
      });
    } catch (Exception) {
      debugPrint("Account Does not exists");
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(notExist);
    }
  }
}