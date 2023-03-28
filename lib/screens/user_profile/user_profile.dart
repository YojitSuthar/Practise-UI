import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final userPreferences=UserPreferences();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: ElevatedButton(onPressed: (){
            userPreferences.logOutsetData(context);

          }, child: const Text("Log Out"))),
    );
  }
}