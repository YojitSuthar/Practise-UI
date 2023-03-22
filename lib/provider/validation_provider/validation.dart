import 'package:flutter/cupertino.dart';

class Validation with ChangeNotifier{

  String _emailValidation="";
  String get emailValidation=>_emailValidation;

  String _passValidation="";
  String get passValidation=>_passValidation;

  void emailValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _emailValidation="Plz Enter Email";
    }else{
      _emailValidation="";
    }
    notifyListeners();
  }

  void passValidate(TextEditingController textCtrl){
    if(textCtrl.text==""){
      _passValidation="Plz Enter Password";
    }else{
      _passValidation="";
    }
    notifyListeners();
  }
}