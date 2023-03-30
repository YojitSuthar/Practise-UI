import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  Wishlist({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("WishList")));
  }
}
