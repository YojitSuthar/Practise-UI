import 'package:database_auth/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInOption extends StatelessWidget {
  
  final String? label;
  final String? icon_image;
  SignInOption({required this.label, required this.icon_image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(30).w),
      height: 45.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon_image!,
            height: 30,
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child:  Text(
                label!,
                style: const TextStyle(fontSize: 15,fontWeight: FontWeightManager.bold),
              ))
        ],
      ),
    );
  }
}