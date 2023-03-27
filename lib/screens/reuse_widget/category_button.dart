import 'package:database_auth/provider/button_color/button_color.dart';
import 'package:database_auth/resources/color_manager.dart';
import 'package:database_auth/resources/resources.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final int index;

  Button({Key? key, required this.label,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onTap = Provider.of<ChangeColor>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(right: 10).r,
      child: Consumer<ChangeColor>(builder: (context,value,child){
        return ElevatedButton(
          onPressed: () {
            if(value.data.contains(index)){
              value.remove(index);
            }else{
              value.data.clear();
              value.add(index);
            }
          },
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor:
              value.data.contains(index) ? ColorManager.blackColor : ColorManager.whiteColor,
              side: BorderSide(width: 1.w, color: ColorManager.blackColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0).w)),
          child: Text(
            label,
            style: fontWeightColorSizeTextStyle(
                FontWeightManager.bold,
                value.data.contains(index) ? ColorManager.whiteColor : ColorManager.blackColor,
                12.sp),
          ),
        );
      },)
    );
  }
}
