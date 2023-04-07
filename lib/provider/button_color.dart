import 'package:flutter/material.dart';

class ChangeColor with ChangeNotifier {

  //we make the login here to  used for search categories so user know which button is selected like ("smartphones,watches,shoes......etc...")
  final List data = [];
  bool color = false;

  void add(int value) {
    data.add(value);
    notifyListeners();
  }

  void remove(int value) {
    data.remove(value);
    notifyListeners();
  }

}