import 'package:ecommerce/auth/auth.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'provider/singin_validation.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  final signin = Signin();

  void logIn(BuildContext context) {
    final signIn = Provider.of<SignInValidation>(context, listen: false);
    if (signIn.checkEmail && signIn.checkPass) {
      signin.signIN(context, textEmailCtrl, textPassCtrl);
    } else {
      debugPrint("not sign in ");
    }
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
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 90).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CompanyDesign(),
                DesignText(text:  StringManager.email, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(
                  topMargin: 5,
                  borderRadius: 30,
                  height: 40,
                    onChanged: validate.emailSignInValidate,
                    textCtrl: textEmailCtrl,
                    hintText: StringManager.enterEmail,
                   ),
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
                    hintText: StringManager.enterPassword,
                    labelText: StringManager.password),
                Consumer<SignInValidation>(builder: (context, value, child) {
                  return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.passValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ));
                }),
                GestureDetector(
                    onTap: () {
                      debugPrint("Forget Password");
                      Get.toNamed("/ForgetPassword");
                    },
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(color: Colors.lightBlue),
                    )),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ).r,
                  child: Button(
                    onPressed: () {
                      logIn(context);
                    },
                    label: StringManager.signIn,
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
                        )),
                  ),
                ]),
                const SignInOption(
                  label: StringManager.googleSignIn,
                  icon_image: IconsAssets.googleLogo,
                ),
                SizedBox(
                  height: 10.h,
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
