import 'package:flutter/material.dart';

class ThemeChange with ChangeNotifier{

  bool isDarkMode=false;

  void themeDarkTrue(){
    isDarkMode=true;
    notifyListeners();
  }
  void themeDarkFalse(){
    isDarkMode=false;
    notifyListeners();
  }
}
