import 'package:flutter/cupertino.dart';
// we create the singin validation to user login in app
class SignInValidation with ChangeNotifier{

  String emailValidation="";
  bool checkEmail=false;

  String passValidation="";
  bool checkPass=false;

  void emailSignInValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      emailValidation="Enter Email";
      checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl.text)) {
      emailValidation= 'Please enter a valid email address';
      checkEmail=false;
    }
    else{
      emailValidation="";
      checkEmail=true;
    }
    notifyListeners();
  }

  void passSignInValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      passValidation="Enter Password";
      checkPass=false;
    }
    else{
      passValidation="";
      checkPass=true;
    }
    notifyListeners();
  }

}