import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_auth/Screens/Home_page/Home_screen.dart';
import 'package:database_auth/provider/validation_provider/validation.dart';
import 'package:database_auth/resources/resources.dart';
import 'package:database_auth/screens/reuse_widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';

class Button extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final Widget? createPage;
  final String? label;
  final double? width;
  final double? height;
  final TextEditingController? textEmailCtrl;
  final TextEditingController? textPassCtrl;
  final TextEditingController? textUserNameCtrl;

  Button(
      {super.key,
      required this.label,
      required this.createPage,
      required this.width,
      required this.height,
      this.textEmailCtrl,
      this.textUserNameCtrl,
      this.textPassCtrl});


  void signUP() {
    debugPrint("Button pressed");
    final userData = <String, dynamic>{
      "UserName": textUserNameCtrl!.text,
      "Email": textEmailCtrl!.text,
      "Password": textPassCtrl!.text
    };
    db.collection("Users").doc(textEmailCtrl!.text.toString()).get().then((value) {
      if (value.exists) {
        debugPrint(value["Email"]);
      } else {
        debugPrint("No email");
        db.collection("Users").doc(textEmailCtrl!.text.toString()).set(userData).then((value) {
          Get.back();
        });
      }
    });
  }

  void signIN(BuildContext context) async {
    debugPrint("Button pressed");
    showDialog(context: context, builder: (context){
      return const Center(child: Loading());
    });
    try{
      await db.collection("Users").doc(textEmailCtrl!.text.toString()).get().then((value) {

        if(value["Email"]==textEmailCtrl!.text && value["Password"]==textPassCtrl!.text){
          Get.offAll(const HomeScreen());
        }
        else{
          debugPrint("invalid caredentials");
        }
      });
    }
    catch (e) {
      debugPrint("Account already exists");
    }
  }
  @override
  Widget build(BuildContext context) {
    final validate = Provider.of<Validation>(context, listen: false);
    return ElevatedButton(
        onPressed: () async {
          if (label == StringManager.signIn) {
            validate.emailValidate(textEmailCtrl!);
            validate.passValidate(textPassCtrl!);
            signIN(context);
          }
          else if (label == StringManager.signUp)
          {
            signUP();
          }
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width!.w, height!.h),
            backgroundColor: RGBColorManager.rgbNeonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40).w)),
        child: Text(
          label!,
          style: fontSizeColorTextStyle(17, ColorManager.blackColor),
        ));
  }
}
