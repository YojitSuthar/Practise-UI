import 'package:flutter/material.dart';
import '../data/product_categorylist.dart';
import '../services/api_constants.dart';
import '../services/api_service.dart';

// fetching the data from api response using provider state management

class ProductData with ChangeNotifier {

  List<dynamic> productData=[];
  final ApiService _getData=ApiService();
  bool loading=true;

  void fetchingData()async {
    final response= await _getData.fetchProduct(APIConstants.baseURL);
    productData=response;
    loading=false;
    ProductCategory.apiData=productData;
    notifyListeners();
  }

  ProductData(){
    debugPrint("calling api service");
    fetchingData();
  }

}


class SearchProductData with ChangeNotifier {

  List<dynamic> productData=[];
  bool loading=true;
  final ApiService _searchGetData=ApiService();

  void searchData(String url)async {
    final response= await _searchGetData.fetchProduct(url);
    productData=response;
    loading=false;
    ProductCategory.searchApiData=productData;
    notifyListeners();
  }

}