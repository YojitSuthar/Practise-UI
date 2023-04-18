import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

// this is the text Field which are  using in login, Signup and Forget Password fields

class NormalTextField extends StatelessWidget {
  final TextEditingController textCtrl;
  final String hintText;
  final Function(String)? onChanged;
  final double height;
  final double borderRadius;
  final double topMargin;



  NormalTextField(
      {super.key,
      required this.textCtrl,
        required this.topMargin,
      required this.hintText,
      required this.height,
      required this.borderRadius,
       this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      margin:  EdgeInsets.only(top: topMargin).r,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.greyOpacityColor),
          borderRadius: BorderRadius.circular(borderRadius).w),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  onChanged!(val);
                },
                cursorColor: ColorManager.lightGreenColor,
                cursorRadius: const Radius.circular(10),
                cursorWidth: 4,
                controller: textCtrl,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10).r),
              )),
        ],
      ),
    );
  }
}

