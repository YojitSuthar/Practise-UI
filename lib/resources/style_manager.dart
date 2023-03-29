import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight super_bold = FontWeight.w900;
}

//Size,family
TextStyle fontSizeFamilyTextStyle(double fontSize, String family){
  return TextStyle(fontSize: fontSize.sp, fontFamily: family);
}
//Size,family,Weight
TextStyle fontSizeFamilyWeightTextStyle(double fontSize,String fontFamily, FontWeight weight) {
  return TextStyle(fontSize: fontSize.sp, fontFamily: fontFamily, fontWeight: weight);
}
//family,Weight,
TextStyle fontFamilyWeightTextStyle(String family,FontWeight weight){
  return TextStyle(fontWeight: weight, fontFamily: family);
}
//weight,Color
TextStyle fontWeightColorTextStyle(FontWeight weight,  Color color){
  return TextStyle(fontWeight: weight, color: color);
}
//weight,size,color
TextStyle fontWeightSizeColorTextStyle(FontWeight weight,double fontSize,Color color){
  return TextStyle(fontWeight: weight, color: color,fontSize: fontSize.sp);
}
//size,Color
TextStyle fontSizeColorTextStyle(double fontSize,  Color color){
  return TextStyle(fontSize: fontSize.sp, color: color);
}
//Size,Weight
TextStyle fontSizeWeightTextStyle(double fontSize,  FontWeight weight,){
  return TextStyle(fontSize: fontSize.sp,fontWeight: weight,);
}