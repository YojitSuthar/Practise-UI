import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/login_screen/login_resources.dart';
import 'package:flutter/material.dart';
import '../../auth/forgetpassword_auth.dart';

class Forget extends StatelessWidget {
   Forget({Key? key}) : super(key: key);

  final TextEditingController textForgetPassCtrl =  TextEditingController();
  final  forget = ForgetPassword();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconButton(),
              const CompanyDesign(),
              NormalTextField(
                  textCtrl: textForgetPassCtrl,
                  hintText: StringManager.enterEmail,
                  label: StringManager.email),
              Container(
                margin: const EdgeInsets.only(
                  top:45,
                ).r,
                child: Button(
                  onPressed: (){
                    forget.forgetPassword(context,textForgetPassCtrl);
                  },
                  label: StringManager.forgetPassword,
                ),
              ),
            ]
        ),
      ),
    );
  }
}
