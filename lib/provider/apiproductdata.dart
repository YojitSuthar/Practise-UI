import 'package:ecommerce/models/product_model/productdata_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/service.dart';

// fetching the data from api response using provider state management

class ProductData with ChangeNotifier {

  List<Product> productData=[];
  bool loading=true;

  void fetchingData()async {
    await ApiService.fetchProduct(APIConstants.baseURL,productData);
    loading=false;
    notifyListeners();
  }
  ProductData(){
    debugPrint("calling api service");
    fetchingData();
  }
}

class SearchProductData with ChangeNotifier {

  List<Product> searchProductData=[];
  bool loading=true;

  void searchData(String url) async{
    searchProductData.clear();
    await ApiService.fetchProduct(url,searchProductData);
    loading=false;
    notifyListeners();
  }

}