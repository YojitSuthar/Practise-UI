import 'package:flutter/material.dart';

// this is the provide of the range slider, that we are using in filtering Screen
class RangeSlide with ChangeNotifier{
  RangeValues currentRangeValues = const RangeValues(10, 50);
  void onchange(RangeValues values){
    currentRangeValues=values;
    notifyListeners();
  }

}