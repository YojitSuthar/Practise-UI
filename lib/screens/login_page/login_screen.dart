import 'package:database_auth/Screens/project_resources/project_resources.dart';
import 'package:database_auth/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController textEmailCtrl = TextEditingController();
  final TextEditingController textPassCtrl = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                          left: 45, right: 45, top: 100, bottom: 100).r,
                  width: 250.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconsAssets.shoppingbag_logo,
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10).r,
                            child: Text(
                              "Academia Products",
                              style: TextStyle(
                                  fontFamily: "academia", fontSize: 30.sp),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5, top: 5).r,
                        child: const Text("Your Favorites",
                            style: TextStyle(
                                fontFamily: "Gruppo",
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Your E-mail address",
                  style: TextStyle(
                      fontWeight: FontWeightManager.bold, color: Colors.black87),
                ),
                NormalTextField(
                    textCtrl: textEmailCtrl, label: "Enter email address"),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Choose a password",
                  style: TextStyle(
                      fontWeight: FontWeightManager.bold, color: Colors.black87),
                ),
                PassField(
                  label: "Password",
                  textPassCtrl: textPassCtrl,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Button(
                    label: "Sign-in     >",
                    createPage: null,
                    width: 450,
                    height: 45,
                  ),
                ),

                Row(children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0).r,
                        child: Divider(
                          color: Colors.black,
                          height: 45.h,
                        )),
                  ),
                  const Text("OR"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0).r,
                        child: Divider(
                          color: Colors.black,
                          height: 45.h,
                        )),
                  ),
                ]),
                SignInOption(label: "Sign-In with google",icon_image: IconsAssets.google_logo,),
                SizedBox(
                  height: 10.h,
                ),
                SignInOption(label: "Sign-In with google",icon_image: IconsAssets.apple_logo,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


