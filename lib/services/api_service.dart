import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/product_model/productdata_model.dart';
import 'service.dart';


class ApiService{

  static Future fetchProduct(String dataUrl,List<Product> product) async {
    debugPrint("Fetching product");
    String url = dataUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    var data = jsonDecode(response.body)['products'];
    if(response.statusCode == ServerStatusCodes.SUCESS) {
      for(Map<String,dynamic> i in data) {
        product.add(Product.fromJson(i));
      }
      debugPrint("data add");
    } else {
      debugPrint("Failed to fetch product");
    }
  }
}