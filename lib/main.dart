import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/res.dart';


class Myapp extends StatelessWidget {
  const Myapp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login":(context)=>LoginPage(),
        "Signup":(context)=>SignUp(),
        "Homepage":(context)=>HomePage(),
        "ViewData":(context)=>ViewData(),
      },
    );
  }
}


Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}
