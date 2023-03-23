import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';
import 'package:flutter/material.dart';
import '../../Screens/Project_resources/project_resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void setData(BuildContext context) async {
    final SharedPreferences userData = await SharedPreferences.getInstance();
    userData.setString("Email","");
    userData.setString("Password", "");
    showDialog(
        context: context,
        builder: (context) {
          return  Center(child: Loading());
        });
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setData(context);
            },
            child: const Text("Log Out")),
      ),
    );
  }
}
