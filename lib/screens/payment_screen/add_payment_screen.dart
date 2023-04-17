import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({Key? key}) : super(key: key);

  final TextEditingController cardNumberCtrl = TextEditingController();
  final TextEditingController expDateCtrl = TextEditingController();
  final TextEditingController cvvCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackIconButton(topPadding: 0),
                DesignText(
                    text: "Payment",
                    fontSize: 20,
                    color: ColorManager.blackColor,
                    padding: 0),

                Container(
                  width: double.infinity,
                  height: 170.h,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage( ProjectImage.cardLogo,),fit: BoxFit.cover)
                  ),
                ),
                DesignText(
                    text: "Card details",
                    fontSize: 18,
                    color: ColorManager.blackColor,
                    padding: 8),
                NormalTextField(
                    hintText: "Card details",
                    textCtrl: cardNumberCtrl,
                    height: 50,
                    borderRadius: 15,
                    topMargin: 12),
                NormalTextField(
                    hintText: "Exp date",
                    textCtrl: cardNumberCtrl,
                    height: 50,
                    borderRadius: 15,
                    topMargin: 12),
                NormalTextField(
                    hintText: "CVV",
                    textCtrl: cardNumberCtrl,
                    height: 50,
                    borderRadius: 15,
                    topMargin: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 40).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint("Cancel");
                        },
                        child: DesignText(
                            text: "Cancel",
                            fontSize: 20,
                            color: ColorManager.grey400Color,
                            padding: 0),
                      ),
                      BlackButton(borderRadius: 15,height: 50, width: 120,onPressed: (){debugPrint("Pressed");},buttonName: "Confirm",)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

