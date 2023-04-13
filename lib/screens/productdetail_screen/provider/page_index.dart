import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier{

  int changeIndex(index,int image){
    image=index;
    notifyListeners();
    return image;
  }
}