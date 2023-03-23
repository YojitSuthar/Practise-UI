import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import '../project_resources/project_resources.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "_SplashScreenState";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  String? email;
  String? pass;


  void getData()async{
    final SharedPreferences userData = await SharedPreferences.getInstance();
    email=userData.getString("Email");
    pass=userData.getString("Password");
    print("Email: " + email!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    navigation();
  }

  void navigation() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(time, () {
      if(email!=null && pass != null && email!.isNotEmpty&& pass!.isNotEmpty)
      {
        Get.off(const HomeScreen());
      }
      else
      {
        Get.off(const GetStartPage(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 700));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
      body: Center(
        child: Lottie.asset(AnimationAssets.splash1_animation),
      ),
    );
  }
}
