import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:databse_auth/Screens/res.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  String? document;

  HomePage({super.key, this.document});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textNameCtrl = TextEditingController();

  TextEditingController textAddressCtrl = TextEditingController();

  TextEditingController textPhoneCtrl = TextEditingController();

  final db = FirebaseFirestore.instance;

  late String email;
  late String pass;
  int counter = 0;
  List productList = [];
  int length = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedData();
    getData(widget.document!);
  }

  void getLength() async {
    await db.collection("Users").doc(widget.document).get().then((value) {
      final List userSnapShot;
      userSnapShot = value["Phone"];
      length = userSnapShot.length;
      print(length);
    });
  }

  void getData(String document) async {
    var userList = await db.collection("Users").doc(document).get();
    print(userList["Phone"]);
    setState(() {
      productList = userList["Phone"];
      print("product data $productList");
    });
  }

  void getSharedData() async {
    final SharedPreferences userData = await SharedPreferences.getInstance();
    setState(() {
      email = userData.getString("Email")!;
      pass = userData.getString("Password")!;
    });
  }

  void setData() async {
    final SharedPreferences userData = await SharedPreferences.getInstance();
    userData.setString("Email", "");
    userData.setString("Password", "");
    Navigator.pushReplacementNamed(context, "login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: textNameCtrl,
              decoration:
                  const InputDecoration(hintText: "Name", label: Text("Name")),
            ),
            TextFormField(
              controller: textAddressCtrl,
              decoration:
                  const InputDecoration(hintText: "Address", label: Text("Address")),
            ),
            TextFormField(
              controller: textPhoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  hintText: "Phone Number", label: Text("Phone Number")),
            ),
            ElevatedButton(
                onPressed: () {
                  productList.add({
                    "Name": textNameCtrl.text,
                    "Address": textAddressCtrl.text,
                    "Phone": textPhoneCtrl.text
                  });
                  final Map<String, dynamic> userData2 = {
                    "Phone": productList,
                  };
                  print(widget.document);
                  db.collection("Users").doc(widget.document).update(userData2).then((value) {
                    print("User Data is added");
                    setState(() {
                      textPhoneCtrl.text = "";
                      textAddressCtrl.text = "";
                      textNameCtrl.text = "";
                    });
                  });
                },
                child: const Text("Add Data")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewData(
                                document: widget.document,
                              )));
                },
                child: const Text("View Data")),
            ElevatedButton(
                onPressed: () {
                  setData();
                },
                child: const Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
