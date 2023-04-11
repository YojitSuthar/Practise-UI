import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class DesignText extends StatelessWidget {
  DesignText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.padding,

  });
  String text;
  double fontSize;
  Color color;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.only(top: padding).r,
        child: Text(
          text,
          style: fontWeightSizeColorTextStyle(
              FontWeightManager.bold, fontSize, color),
        ));
  }
}