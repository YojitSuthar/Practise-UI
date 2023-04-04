import 'package:flutter/material.dart';
import '../../auth/sing_up.dart';
import 'signup_resources.dart';

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
                const BackIconButton(),
                const CompanyDesign(),
                NormalTextField(
                    onChanged: validate.userNameSignUpValidate,
                    textCtrl: textUserNameCtrl,
                    hintText: StringManager.enterUserName,
                    label: StringManager.userName),
                Consumer<SignUpValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpUserNameValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                NormalTextField(
                  onChanged: validate.emailSignUpValidate,
                    textCtrl: textEmailCtrl,
                    hintText: StringManager.enterEmail,
                    label: StringManager.email),
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
