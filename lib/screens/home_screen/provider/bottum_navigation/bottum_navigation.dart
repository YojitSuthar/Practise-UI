import 'package:flutter/material.dart';

class BottumNavigation with ChangeNotifier{

  //Its logic for bottum bar navigation bar for changing body of a page
  final List contain=[0];
  int selected=0;

  void change(int index){
    selected=index;
    notifyListeners();
  }

  void add(int value) {
    contain.add(value);
    notifyListeners();
  }

}