import 'package:database_auth/resources/color_manager.dart';
import 'package:database_auth/resources/style_manager.dart';
import 'package:flutter/material.dart';

class WarningBar{
  SnackBar snack(String warning) {
    return SnackBar(
      content: Text(
        warning,
        style: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 15,
            fontWeight: FontWeightManager.semiBold),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: '',
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
  }
}