import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';
import 'package:database_auth/resources/resources.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController textUserNameCtrl = TextEditingController();
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              children:  [
                const CompanyDesign(),
                NormalTextField(
                    textCtrl: textUserNameCtrl,
                    hintText: StringManager.enterUserName,
                    label: StringManager.userName),
                NormalTextField(
                    textCtrl: textEmailCtrl,
                    hintText: StringManager.enterEmail,
                    label: StringManager.email),
                PassField(
                    hintText: StringManager.password,
                    textPassCtrl: textPassCtrl,
                    labelText: StringManager.password),
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
