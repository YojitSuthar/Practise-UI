import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier{

  int pageIndex=0;

  void changeIndex(index){
    pageIndex=index;
    notifyListeners();
  }

}