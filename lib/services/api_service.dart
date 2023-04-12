import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'status_codes.dart';


class ApiService{

  Future fetchProduct(String dataUrl) async {
    debugPrint("Fetching product");
    String url = dataUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode==ServerStatusCodes.SUCESS) {
      final body = response.body;
      print(body);
      final json = jsonDecode(body);
      return json["products"];
    }
    else{
      debugPrint("Failed to fetch product");
    }

  }
}