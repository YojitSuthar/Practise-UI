
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';


class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key? key}) : super(key: key);

  final TextEditingController cardNumberCtrl=TextEditingController();
  final TextEditingController expDateCtrl=TextEditingController();
  final TextEditingController cvvCtrl=TextEditingController();

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
                DesignText(text: "Payment", fontSize: 20, color: ColorManager.blackColor, padding: 0),
                SizedBox(
                  height: 170.h,
                  width: double.infinity,
                  child: Image.asset(ProjectImage.cardLogo,fit: BoxFit.cover,),
                ),
                DesignText(text: "Card details", fontSize: 18, color: ColorManager.blackColor, padding: 8),
                NormalTextField(label:"Card number" ,textCtrl: cardNumberCtrl,hintText: "Card details",),
                NormalTextField(label:"Exp date" ,textCtrl: expDateCtrl,hintText: "Enter Exp date",),
                NormalTextField(label:"CVV" ,textCtrl: cvvCtrl,hintText: "Enter Cvv",),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
