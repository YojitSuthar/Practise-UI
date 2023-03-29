import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/screens/login_page/provider/singin_validation.dart';
import 'package:ecommerce/screens/signup_page/provider/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class NormalTextField extends StatefulWidget {
  TextEditingController textCtrl;
  String? hintText;
  String? label;
  String? pageLabel;
  String? checkField;
  bool noPassTextField;

  NormalTextField(
      {super.key,
      required this.textCtrl,
      required this.hintText,
      required this.pageLabel,
      required this.checkField,
      required this.noPassTextField,
      required this.label});

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  bool obSure = false;

  void signUp(String value, BuildContext context, String label) {
    final singUpValidate = Provider.of<SignUpValidation>(context, listen: false);
    if(label=="signupUsername"){
      singUpValidate.userNameSignUpValidate(value);
    }
    else  if(label=="signUpEmail"){
      singUpValidate.emailSignUpValidate(value);
    }
    else{
      singUpValidate.passSignUpValidate(value);
    }
  }

  void signIn(String value, BuildContext context, String label) {
    final singinValidate = Provider.of<SignInValidation>(context, listen: false);
    if(label=="emailLogin"){
      singinValidate.emailSignInValidate(value);
    }
    else{
      singinValidate.passSignInValidate(value);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: fontWeightColorTextStyle(
              FontWeightManager.bold, ColorManager.black87Color),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5).r,
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.greyOpacityColor),
              borderRadius: BorderRadius.circular(30).w),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                onChanged: (val) {
                  if(widget.pageLabel=="Login"){
                    signIn(val, context,widget.checkField!);
                  }
                  else if (widget.pageLabel=="Signup"){
                    signUp(val, context,widget.checkField!);
                  }
                },
                cursorColor: ColorManager.lightGreenColor,
                cursorRadius: const Radius.circular(10),
                cursorWidth: 4,
                obscureText: obSure,
                controller: widget.textCtrl,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10).r),
              )),
              AbsorbPointer(
                absorbing: widget.noPassTextField,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        obSure = !obSure;
                      });
                    },
                    icon: widget.noPassTextField
                        ? const Icon(null)
                        : obSure
                            ? Icon(
                                FluentSystemIcons.ic_fluent_eye_show_filled,
                                color: Colors.grey[600],
                              )
                            : const Icon(
                                FluentSystemIcons.ic_fluent_eye_hide_filled)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
