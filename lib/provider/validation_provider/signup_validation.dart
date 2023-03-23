import 'package:flutter/cupertino.dart';

class SignUpValidation with ChangeNotifier{

  String _signUpEmailValidation="";
  String get signUpEmailValidation=>_signUpEmailValidation;
  bool _checkEmail=false;
  bool get checkEmail=>_checkEmail;

  String _signUpPassValidation="";
  String get signUpPassValidation=>_signUpPassValidation;
  bool _checkPass=false;
  bool get checkPass=>_checkPass;

  String _signUpUserNameValidation="";
  String get signUpUserNameValidation=>_signUpUserNameValidation;
  bool _checkUserName=false;
  bool get checkUserName=>_checkUserName;

  void userNameSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _signUpUserNameValidation="Enter User Name";
      _checkUserName=false;
    }
    else{
      _signUpUserNameValidation="";
      _checkUserName=true;
    }
    notifyListeners();
  }

  void emailSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _signUpEmailValidation="Enter Email(signup)";
      _checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl.text)) {
      _signUpEmailValidation= 'Please enter a valid email address';
      _checkEmail=false;
    }
    else{
      _signUpEmailValidation="";
      _checkEmail=true;
    }
    notifyListeners();
  }

  void passSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _signUpPassValidation="Enter Password(signup)";
      _checkPass=false;
    }else if(textCtrl.text.length<8){
      _signUpPassValidation="Enter 8 character password";
      _checkPass=false;
    }
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(textCtrl.text)){
      _signUpPassValidation="Enter Strong  password";
      _checkPass=false;
    }
    else{
      _signUpPassValidation="";
      _checkPass=true;
    }
    notifyListeners();
  }


}