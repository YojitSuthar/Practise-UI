import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../resources/resources.dart';

class UserTextField extends StatelessWidget {


  UserTextField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.fieldLength
  });
  String label;
  TextInputType keyboardType;
  int fieldLength;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 235.w,
      child: TextFormField(
        inputFormatters: [
           LengthLimitingTextInputFormatter(fieldLength),
        ],
        keyboardType: keyboardType,
        controller: null,
        cursorHeight: 25,
        cursorRadius: const Radius.circular(10).w,
        cursorColor: ColorManager.blackColor,
        decoration: InputDecoration(
          hintText: label,
          contentPadding:
          const EdgeInsets.only(left: 1, top: 5).r,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.greyColor, width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkGreyColor,
                width: 2.1), //<-- SEE HERE
          ),
        ),
      ),
    );
  }
}