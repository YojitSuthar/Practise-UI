import 'package:flutter/material.dart';

class ThemeChange with ChangeNotifier{

  bool isDarkMode=false;

  void themeDark(){
    isDarkMode=true;
    notifyListeners();
  }
}
