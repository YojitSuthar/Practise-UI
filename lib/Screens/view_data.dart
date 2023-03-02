import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  String? document;
  ViewData({super.key, this.document});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  TextEditingController textNameCtrl = TextEditingController();
  TextEditingController textPhoneCtrl = TextEditingController();

  @override
  initState() {
    super.initState();
    getData(widget.document!);
  }

  final db = FirebaseFirestore.instance;
  List userCard = [];

  void getData(String document) async {
    var userList = await db.collection("Users").doc(document).get();
    print(userList["Phone"]);
    setState(() {
      userCard = userList["Phone"];
      print(userCard);
    });
  }

  void editData(TextEditingController name, TextEditingController age,
      int index, String documentPath) async {
    final Map<String, dynamic> userData2 = {
      "Phone": userCard,
    };
    userCard[index]["Name"] = name.text;
    userCard[index]["Phone"] = age.text;
    await db
        .collection("Users")
        .doc(documentPath)
        .update(userData2)
        .then((value) {
      print("add Data");
    });
  }

  showFrom(int index) {
    textNameCtrl.text = userCard[index]["Name"];
    textPhoneCtrl.text = userCard[index]["Phone"];

    showModalBottomSheet(
        context: context,
        elevation: 20,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: textNameCtrl,
                    decoration: const InputDecoration(
                        hintText: "Name", label: Text("Name")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textPhoneCtrl,
                    decoration: const InputDecoration(
                        hintText: "Phone number", label: Text("Phone number")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        editData(textNameCtrl, textPhoneCtrl, index,
                            widget.document!);
                        textNameCtrl.text = "";
                        textPhoneCtrl.text = "";
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: const Text("Edit"))
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Data"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: userCard.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.pinkAccent,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: userCard.isEmpty
                        ? const Text("no Data")
                        : Text(userCard[index]["Name"]),
                    subtitle: userCard.isEmpty
                        ? const Text("no Data")
                        : Text(userCard[index]["Phone"]),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                showFrom(index);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
