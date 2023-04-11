import 'package:ecommerce/resources/color_manager.dart';
import 'package:ecommerce/resources/style_manager.dart';
import 'package:flutter/material.dart';

// This is the snack bar which give the update to user in perform action
class WarningBar{
   SnackBar snack(String warning,Color backgroundColor) {
    return SnackBar(
      content: Text(
        warning,
        style: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 15,
            fontWeight: FontWeightManager.semiBold),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    );
  }
}