import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService{

  Future fetchProduct() async {
    print("Fetching product");
    const url = "https://dummyjson.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    return json["products"];

  }
}