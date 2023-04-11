import 'package:flutter/material.dart';
import '../data/product_categorylist.dart';
import '../services/api_service.dart';

// fetching the data from api response using provider state management
class ProductData with ChangeNotifier {

  List<dynamic> productData=[];
  final ApiService _getData=ApiService();
  bool loading=true;

  void fetchingData()async {
    final response= await _getData.fetchProduct();
    productData=response;
    loading=false;
    ProductCategory.apiData=productData;
    notifyListeners();
  }

  ProductData(){
    print("calling api service");
    fetchingData();
  }

}