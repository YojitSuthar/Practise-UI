import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class NormalTextField extends StatelessWidget {
  TextEditingController textCtrl;
  String hintText;
  String label;
  final Function(String)? onChanged;

  NormalTextField(
      {super.key,
      required this.textCtrl,
      required this.hintText,
       this.onChanged,
      required this.label});

  bool obSure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: fontWeightColorTextStyle(
              FontWeightManager.bold, ColorManager.black87Color),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5).r,
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.greyOpacityColor),
              borderRadius: BorderRadius.circular(30).w),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
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
        ),
      ],
    );
  }
}
