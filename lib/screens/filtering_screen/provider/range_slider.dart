import 'package:flutter/material.dart';


class RangeSlide with ChangeNotifier{
  RangeValues currentRangeValues = const RangeValues(10, 50);
  void onchange(RangeValues values){
    currentRangeValues=values;
    notifyListeners();
  }

}