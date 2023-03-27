import 'package:flutter/material.dart';

class ChangeColor with ChangeNotifier {

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