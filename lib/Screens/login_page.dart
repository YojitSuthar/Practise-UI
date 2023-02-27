import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Login Page"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(decoration: InputDecoration(
              hintText: "Email"
            ),),
            TextFormField(decoration: InputDecoration(
              hintText: "Password"
            )),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "Homepage");
            }, child: Text("Sign In"),),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "Signup");
            }, child: Text("Sign Up")),
          ],
        ),
      ),

    );
  }
}
