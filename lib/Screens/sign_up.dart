import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  final db = FirebaseFirestore.instance;

  TextEditingController textUserCtrl = TextEditingController();
  TextEditingController textEmailCtrl = TextEditingController();
  TextEditingController textPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: textUserCtrl,
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextFormField(
                controller: textEmailCtrl,
                decoration: InputDecoration(hintText: "Email")),
            TextFormField(
                controller: textPassCtrl,
                decoration: InputDecoration(hintText: "Password")),
            ElevatedButton(
                onPressed: () {
                  final  userData= <String,dynamic>{
                    ""
                    "UserName": textEmailCtrl.text,
                    "Email": textEmailCtrl.text.toString(),
                    "Password": textPassCtrl.text
                  };
                  db.collection("Users").doc(textEmailCtrl.text.toString()).set(userData).then((value){

                  });
                  // db.collection("Users").doc(textEmailCtrl.text.toString()).set(userData);
                  },
                child: Text("Sign in"))

          ],
        ),
      ),
    );
  }
}
