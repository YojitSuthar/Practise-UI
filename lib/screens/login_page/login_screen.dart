
import 'package:database_auth/resources/resources.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);
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
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(10.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CompanyDesign(),
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
                    label: StringManager.signIn,
                    createPage: null,
                    width: 450,
                    height: 45,
                    textEmailCtrl: textEmailCtrl,
                    textPassCtrl: textPassCtrl,
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 10.0, right: 20.0).r,
                        child: Divider(
                          color: ColorManager.blackColor,
                          height: 45.h,
                        )),
                  ),
                  const Text("OR"),
                  Expanded(
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 20.0, right: 10.0).r,
                        child: Divider(
                          color: ColorManager.blackColor,
                          height: 50.h,
                        )),
                  ),
                ]),
                SignInOption(
                  label: StringManager.googleSignIn,
                  icon_image: IconsAssets.google_logo,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SignInOption(
                  label: StringManager.appleSignIn,
                  icon_image: IconsAssets.apple_logo,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10).r,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen(),
                                transition: Transition.fade,
                                duration: const Duration(milliseconds: 700));
                        debugPrint("SignIn");
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              color: ColorManager.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeightManager.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    color: ColorManager.lightBlueColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeightManager.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


