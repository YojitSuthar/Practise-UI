import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';

import '../screens/reuse_widget/loading.dart';
import '../screens/reuse_widget/snack_bar.dart';

class Signin{
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();
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
          .doc(textEmailCtrl.text.toString().trim())
          .get()
          .then((value) {
        if (value["Email"] == textEmailCtrl.text.trim() &&
            value["Password"] == textPassCtrl.text) {
          Get.offAll( HomeScreen());
        } else {
          debugPrint("invalid caredentials");
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