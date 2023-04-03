import 'package:ecommerce/auth/sign_in.dart';
import 'package:ecommerce/auth/sing_up.dart';
import 'package:ecommerce/provider/absorbing.dart';
import 'package:ecommerce/screens/signup_screen/provider/signup_validation.dart';
import 'package:ecommerce/screens/login_screen/provider/singin_validation.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class Button extends StatelessWidget {

  final signup = Signup();
  final signin = Signin();
  final String label;
  final double width;
  final double height;

  final TextEditingController? textEmailCtrl;
  final TextEditingController? textPassCtrl;
  final TextEditingController? textUserNameCtrl;

  Button(
      {super.key,
      required this.label,
      required this.width,
      required this.height,
      this.textEmailCtrl,
      this.textUserNameCtrl,
      this.textPassCtrl});


   void Onpressed(BuildContext context) {
    final signIn = Provider.of<SignInValidation>(context, listen: false);
    final signUp = Provider.of<SignUpValidation>(context, listen: false);
    if (label == StringManager.signIn) {
      signIn.emailSignInValidate(textEmailCtrl!.text);
      signIn.passSignInValidate(textPassCtrl!.text);
      if (signIn.checkEmail && signIn.checkPass) {
        signin.signIN(context, textEmailCtrl!, textPassCtrl!);
      } else {
        debugPrint("not sign in ");
      }
    } else if (label == StringManager.signUp) {
      signUp.emailSignUpValidate(textEmailCtrl!.text);
      signUp.passSignUpValidate(textPassCtrl!.text);
      signUp.userNameSignUpValidate(textUserNameCtrl!.text);
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
    final signIn = Provider.of<SignInValidation>(context, listen: false);
    final signUp = Provider.of<SignUpValidation>(context, listen: false);
    final absorb = Provider.of<Absorbing>(context, listen: false);
    return Consumer<Absorbing>(builder: (context,value,child){
        return AbsorbPointer(
          absorbing: value.absorbButton,
          child: ElevatedButton(
              onPressed: (){
                Onpressed(context);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width.w, height.h),
                  backgroundColor: value.absorbButton?RGBColorManager.rgbWhiteColor:RGBColorManager.rgbNeonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40).w)),
              child: Text(
                label,
                style: fontSizeColorTextStyle(17, ColorManager.blackColor),
              )),
        );
      });

  }
}
