import 'package:flutter/cupertino.dart';

class SignInValidation with ChangeNotifier{

  String _emailValidation="";
  String get emailValidation=>_emailValidation;
  bool _checkEmail=false;
  bool get checkEmail=>_checkEmail;

  String _passValidation="";
  String get passValidation=>_passValidation;
  bool _checkPass=false;
  bool get checkPass=>_checkPass;


  void emailSignInValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _emailValidation="Enter Email";
      _checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl.text)) {
      _emailValidation= 'Please enter a valid email address';
      _checkEmail=false;
    }
    else{
      _emailValidation="";
      _checkEmail=true;
    }
    notifyListeners();
  }

  void passSignInValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _passValidation="Enter Password";
      _checkPass=false;
    }
    else{
      _passValidation="";
      _checkPass=true;
    }
    notifyListeners();
  }

}