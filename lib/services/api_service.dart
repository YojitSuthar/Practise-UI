import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/productdata.dart';

class ApiService{

  void fetchProduct() async {
    print("Fetching product");
    const url = "https://dummyjson.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    ProductData.productData=json["products"];
    print(ProductData.productData);
  }
}