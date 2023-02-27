import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
import 'Screens/login_page.dart';
import 'Screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "login",
      routes: {
        "login":(context)=>LoginPage(),
        "Signup":(context)=>SignUp(),
        "Homepage":(context)=>HomePage()
      },
    );
  }
}


Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}
