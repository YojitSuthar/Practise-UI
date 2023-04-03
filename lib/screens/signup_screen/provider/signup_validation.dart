import 'package:flutter/cupertino.dart';

class SignUpValidation with ChangeNotifier{

  String signUpEmailValidation="";
  bool checkEmail=false;

  String signUpPassValidation="";
  bool checkPass=false;

  String signUpUserNameValidation="";
  bool checkUserName=false;

  void userNameSignUpValidate(String textCtrl){
    if(textCtrl==""){
      signUpUserNameValidation="Enter User Name";
      checkUserName=false;
    }
    else{
      signUpUserNameValidation="";
      checkUserName=true;
    }
    notifyListeners();
  }

  void emailSignUpValidate(String textCtrl){
    if(textCtrl==""){
      signUpEmailValidation="Enter Email";
      checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl)) {
      signUpEmailValidation= 'Please enter a valid email address';
      checkEmail=false;
    }
    else{
      signUpEmailValidation="";
      checkEmail=true;
    }
    notifyListeners();
  }

  void passSignUpValidate(String textCtrl){
    if(textCtrl==""){
      signUpPassValidation="Enter Password";
      checkPass=false;
    }else if(textCtrl.length<8){
      signUpPassValidation="Enter 8 character password";
      checkPass=false;
    }
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(textCtrl)){
      signUpPassValidation="Enter Strong  password";
      checkPass=false;
    }
    else{
      signUpPassValidation="";
      checkPass=true;
    }
    notifyListeners();
  }


}