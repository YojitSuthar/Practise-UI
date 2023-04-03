import 'login_resources.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  void signIn(String value, BuildContext context, String label) {
    final singinValidate = Provider.of<SignInValidation>(context, listen: false);

  }


  @override
  Widget build(BuildContext context) {
    final validate = Provider.of<SignInValidation>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 90).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CompanyDesign(),
                NormalTextField(
                  onChanged: validate.emailSignInValidate,
                    textCtrl: textEmailCtrl,
                    hintText: StringManager.enterEmail,
                    label: StringManager.email),
                Consumer<SignInValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.emailValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                PassField(
                  onChanged: validate.passSignInValidate,
                    textPassCtrl: textPassCtrl,
                    hintText:StringManager.enterPassword,
                    labelText: StringManager.password),
                Consumer<SignInValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.passValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                    ).r,
                    child: Button(
                      label: StringManager.signIn,
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
                          height: 45.h,
                        )),),
                ]),
                const SignInOption(
                  label: StringManager.googleSignIn,
                  icon_image: IconsAssets.googleLogo,
                ),
                SizedBox(height:10.h,
                ),
                const SignInOption(
                  label: StringManager.appleSignIn,
                  icon_image: IconsAssets.appleLogo,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10).r,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        debugPrint("SignIn");
                        Get.toNamed("/SignUp");
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
