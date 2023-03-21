import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormService {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
}

class NormalTextField extends StatelessWidget {
  TextEditingController textCtrl;
  String? label;

  NormalTextField({super.key, required this.textCtrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(30).w),
      child: Expanded(
          child: TextFormField(
        cursorColor: Colors.lightGreen,
        cursorRadius: const Radius.circular(10),
        cursorWidth: 4,
        controller: textCtrl,
        decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 10).r),
      )),
    );
  }
}
