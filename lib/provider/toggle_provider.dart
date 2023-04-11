import 'package:flutter/material.dart';

//perform the functioning on toggle button

class Toggle with ChangeNotifier{
  bool onchange(bool values,bool change ){
    change=values;
    notifyListeners();
    return change;
  }
}