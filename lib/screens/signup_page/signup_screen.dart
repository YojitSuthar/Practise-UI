import 'package:flutter/material.dart';
import 'signup_resources.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController textUserNameCtrl = TextEditingController();
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUp = Provider.of<SignUpValidation>(context, listen: false);
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconButton(),
                const CompanyDesign(),
                NormalTextField(
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
                    hintText: StringManager.password,
                    textPassCtrl: textPassCtrl,
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
                    label: StringManager.signUp,
                    createPage: null,
                    width: 450,
                    height: 45,
                    textEmailCtrl: textEmailCtrl,
                    textPassCtrl: textPassCtrl,
                    textUserNameCtrl: textUserNameCtrl,
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
