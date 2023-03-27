import 'package:flutter/cupertino.dart';

class SignUpValidation with ChangeNotifier{

  String signUpEmailValidation="";
  bool checkEmail=false;

  String signUpPassValidation="";
  bool checkPass=false;

  String signUpUserNameValidation="";
  bool checkUserName=false;

  void userNameSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      signUpUserNameValidation="Enter User Name";
      checkUserName=false;
    }
    else{
      signUpUserNameValidation="";
      checkUserName=true;
    }
    notifyListeners();
  }

  void emailSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      signUpEmailValidation="Enter Email";
      checkEmail=false;
    }
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(textCtrl.text)) {
      signUpEmailValidation= 'Please enter a valid email address';
      checkEmail=false;
    }
    else{
      signUpEmailValidation="";
      checkEmail=true;
    }
    notifyListeners();
  }

  void passSignUpValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      signUpPassValidation="Enter Password";
      checkPass=false;
    }else if(textCtrl.text.length<8){
      signUpPassValidation="Enter 8 character password";
      checkPass=false;
    }
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(textCtrl.text)){
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