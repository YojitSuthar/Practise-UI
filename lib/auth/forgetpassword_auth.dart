import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/string_manager.dart';
import '../screens/reuse_widget/loading.dart';
import '../screens/reuse_widget/snack_bar.dart';

class ForgetPassword {

   void forgetPassword(
      BuildContext context, TextEditingController forgetPassword) async {
    final bar = WarningBar();
    final successFull = bar.snack(StringManager.emailSent,ColorManager.greenColor);
    final invalid = bar.snack(StringManager.error,ColorManager.redColor);
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: Loading());
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetPassword.text.trim())
          .then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(successFull);
      });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(invalid);
      debugPrint("Failed to forget password");
    }
  }
}
