import 'package:database_auth/auth/sign_in.dart';
import 'package:database_auth/auth/sing_up.dart';
import 'package:database_auth/provider/validation_provider/signup_validation.dart';
import 'package:database_auth/provider/validation_provider/singin_validation.dart';
import 'package:database_auth/resources/resources.dart';
import 'package:database_auth/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';

class Button extends StatelessWidget {
  final signup = Signup();
  final signin = Signin();
  final Widget? createPage;
  final String? label;
  final double? width;
  final double? height;
  final TextEditingController? textEmailCtrl;
  final TextEditingController? textPassCtrl;
  final TextEditingController? textUserNameCtrl;
  final userPreferences=UserPreferences();
  Button(
      {super.key,
      required this.label,
      required this.createPage,
      required this.width,
      required this.height,
      this.textEmailCtrl,
      this.textUserNameCtrl,
      this.textPassCtrl});


   void Onpressed(BuildContext context) {
    final signIn = Provider.of<SignInValidation>(context, listen: false);
    final signUp = Provider.of<SignUpValidation>(context, listen: false);
    if (label == StringManager.signIn) {
      signIn.emailSignInValidate(textEmailCtrl!);
      signIn.passSignInValidate(textPassCtrl!);
      if (signIn.checkEmail && signIn.checkPass) {
        userPreferences.saveLoginUserInfo(textEmailCtrl!.text,textPassCtrl!.text);
        signin.signIN(context, textEmailCtrl!, textPassCtrl!);
      } else {
        debugPrint("not sign in ");
      }
    } else if (label == StringManager.signUp) {
      signUp.emailSignUpValidate(textEmailCtrl!);
      signUp.passSignUpValidate(textPassCtrl!);
      signUp.userNameSignUpValidate(textUserNameCtrl!);
      if (signUp.checkEmail && signUp.checkPass && signUp.checkUserName) {
        signup.signUP(
            context, textEmailCtrl!, textPassCtrl!, textUserNameCtrl!);
      } else {
        debugPrint("not sign in ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Onpressed(context);
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
