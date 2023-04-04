import 'package:flutter/cupertino.dart';
// we create the singin validation to user login in app
class SignInValidation with ChangeNotifier{

  String emailValidation="";
  bool checkEmail=false;

  String passValidation="";
  bool checkPass=false;

   void emailSignInValidate(String textCtrl){
    if(textCtrl==""){
      emailValidation="Enter Email";
      checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl)) {
      emailValidation= 'Enter a valid email address';
      checkEmail=false;
    }
    else{
      emailValidation="";
      checkEmail=true;
    }
    notifyListeners();
  }

  void passSignInValidate(String textCtrl){
    if(textCtrl==""){
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