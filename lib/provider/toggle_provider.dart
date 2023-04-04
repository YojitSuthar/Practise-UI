import 'package:flutter/material.dart';

class Toggle with ChangeNotifier{
  bool onchange(bool values,bool change ){
    change=values;
    notifyListeners();
    return change;
  }
}