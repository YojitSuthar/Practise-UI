import 'package:flutter/material.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import 'package:ecommerce/auth/auth.dart';
import 'provider/signup_validation.dart';



class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController textUserNameCtrl = TextEditingController();
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();
  final signup = Signup();

  void signUp(BuildContext context){
    final signIn = Provider.of<SignUpValidation>(context, listen: false);
    if (signIn.checkEmail && signIn.checkPass) {
      signup.signUP(context, textEmailCtrl,textPassCtrl, textUserNameCtrl);
    } else {
      debugPrint("not sign in ");
    }
  }

  @override
  Widget build(BuildContext context) {
    final validate = Provider.of<SignUpValidation>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackIconButton(topPadding: 30),
                const CompanyDesign(),
                DesignText(text:  StringManager.userName, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(height: 40,
                    topMargin: 5,
                    borderRadius: 30,
                    onChanged: validate.userNameSignUpValidate,
                    textCtrl: textUserNameCtrl,
                    hintText: StringManager.enterUserName,
                    ),
                Consumer<SignUpValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpUserNameValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                DesignText(text:  StringManager.enterEmail, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(
                   topMargin: 5,
                  borderRadius: 30,
                  height: 40,
                  onChanged: validate.emailSignUpValidate,
                    textCtrl: textEmailCtrl,
                    hintText: StringManager.enterEmail,
                    ),
                Consumer<SignUpValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpEmailValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
              PassField(
                  onChanged: validate.passSignUpValidate,
                  textPassCtrl: textPassCtrl,
                  hintText:StringManager.enterPassword,
                  labelText: StringManager.password),
                Consumer<SignUpValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpPassValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ).r,
                  child: Button(
                    onPressed: (){
                      signUp(context);
                    },
                    label: StringManager.signUp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
