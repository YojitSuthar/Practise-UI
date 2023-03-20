import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:databse_auth/Screens/reuse_widget/pass_text_field.dart';
import 'package:databse_auth/Screens/reuse_widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {

  final db = FirebaseFirestore.instance;
  TextEditingController textUserCtrl = TextEditingController();
  TextEditingController textEmailCtrl = TextEditingController();
  TextEditingController textPassCtrl = TextEditingController();

  void setData(String email,String password) async{
    final SharedPreferences userData = await SharedPreferences.getInstance();
    userData.setString("Email", email);
    userData.setString("Password", password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NTextField(
              textCtrl: textUserCtrl,
              label: "Username",
            ),
            NTextField(
              textCtrl: textEmailCtrl,
              label: "Email",
            ),
            PassField(label: "Password",textPassCtrl: textPassCtrl,),
            ElevatedButton(
                onPressed: () {
                  final  userData= <String,dynamic>{
                    "UserName": textUserCtrl.text,
                    "Email": textEmailCtrl.text,
                    "Password": textPassCtrl.text
                  };
                  db.collection("Users").doc(textEmailCtrl.text.toString()).get().then((value){
                    if(value.exists){
                      print(value["Email"]);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account alredy exists")));
                    }
                    else{
                      print("No email");
                      setData(textEmailCtrl.text, textPassCtrl.text);
                      db.collection("Users").doc(textEmailCtrl.text.toString()).set(userData).then((value) {
                        Navigator.pop(context);
                      });
                    }
                  });
                  },
                child: Text("Sign in"))
          ],
        ),
      ),
    );
  }
}
