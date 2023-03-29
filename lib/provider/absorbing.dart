import 'package:flutter/material.dart';


class Absorbing with ChangeNotifier{
  bool absorbButton=false;

  void buttonAbsorbingTrue(){
    absorbButton=true;
    notifyListeners();
  }

  void buttonAbsorbingFalse(){
    absorbButton=false;
    notifyListeners();
  }
}
