import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final Widget? createPage;
  final String? label;
  final double? width;
  final double? height;

  Button({required this.label,required this.createPage,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(createPage,
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 700));
          print("Button pressed");

        },
        style: ElevatedButton.styleFrom(
            fixedSize:  Size(width!.w, height!.h),
            backgroundColor: const Color.fromRGBO(189, 247, 50, 1),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40).w)),
        child: Text(
          label!,
          style: TextStyle(color: Colors.black, fontSize: 17.sp),
        ));
  }
}
