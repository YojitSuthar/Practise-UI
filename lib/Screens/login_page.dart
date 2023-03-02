import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:databse_auth/Screens/reuse_widget/pass_text_field.dart';
import 'package:databse_auth/Screens/reuse_widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'res.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final db = FirebaseFirestore.instance.collection("Users");

   late String email;
   late String pass;

  TextEditingController textEmailCtrl = TextEditingController();

  TextEditingController textPassCtrl = TextEditingController();

   void setData(String userEmail,String userPassword) async{
    final SharedPreferences userCredentials=await SharedPreferences.getInstance();
    userCredentials.setString("Email", userEmail);
    userCredentials.setString("Password", userPassword);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData()async{
    final SharedPreferences userData = await SharedPreferences.getInstance();
      email=userData.getString("Email")!;
      pass=userData.getString("Password")!;
    if(email!=null && pass != null && email.isNotEmpty&& pass.isNotEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(document: textEmailCtrl.text)));
    }
    else
    {
      print("No email or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NTextField(label: "E-mail",textCtrl: textEmailCtrl),
            PassField(label: "Password",textPassCtrl: textPassCtrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try{
                      await db.doc(textEmailCtrl.text).get().then((value) {
                        if(value["Email"]==textEmailCtrl.text && value["Password"]==textPassCtrl.text){
                          setData(value["Email"], value["Password"]);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(document: textEmailCtrl.text)));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Invalid Credentials")));
                        }
                      });
                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account Does not exists")));
                    }
                  },
                  child: const Text("Sign In"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "Signup");
                    },
                    child: const Text("Sign Up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
