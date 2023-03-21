import 'package:database_auth/Screens/project_resources/project_resources.dart';
import 'package:flutter/material.dart';
import 'package:database_auth/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartPage extends StatelessWidget {
  static const String id = "GetStartPage";

  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(17, 17, 17, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(150).w,
                      bottomRight: const Radius.circular(150).w)),
              child:
                  Image.asset(ProjectImage.comapny_logo, fit: BoxFit.scaleDown),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0).w,
              child: Container(
                child: Text(
                  "Academia Products",
                  style: TextStyle(fontFamily: "academia", fontSize: 40.sp),
                ),
              ),
            ),
            Container(
              child: Text("A Platform You can get yours Favourite",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Gruppo",
                      fontWeight: FontWeightManager.bold)),
            ),
            Container(
                margin: const EdgeInsets.only(top: 80).r,
                child: Button(
                  label: "Get Start Shopping  >",
                  createPage: LoginScreen(),
                  width: 200,height: 50,
                ))
          ],
        ),
      ),
    );
  }
}
