import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProductData with ChangeNotifier {

   List<dynamic> productData=[];
  final ApiService _getData=ApiService();
  bool loading=true;

  void fetchingData()async {
    final response= await _getData.fetchProduct();
    productData=response;
    loading=false;
    notifyListeners();
  }

  ProductData(){
    print("calling api service");
    fetchingData();
  }



}