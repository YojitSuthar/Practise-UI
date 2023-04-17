import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  List<Map<String, String>> card = [
    {
      "Card":
          "https://p1.hiclipart.com/preview/849/152/27/love-background-heart-mastercard-logo-credit-card-bank-card-maestro-visa-orange-png-clipart.jpg",
      "name": "Credit Card"
    },
    {
      "Card": "https://avatars.githubusercontent.com/u/476675?s=280&v=4",
      "name": "Paypal"
    },
    {
      "Card":
          "https://www.visa.com/images/merchantoffers/2022-09/1663659882602.visa_logo.jpg",
      "name": "Visa"
    },
    {
      "Card":
          "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1",
      "name": "Google Pay"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackIconButton(topPadding: 0),
            DesignText(
                text: "Payment",
                fontSize: 20,
                color: ColorManager.blackColor,
                padding: 0),
            SizedBox(
              height: 285.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: card.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15).r,
                    child: CardContainer(
                        height: 55,
                        borderRadius: 25,
                        allPadding: 12,
                        bottumMargin: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        card[index]["Card"].toString()),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  DesignText(
                                      text: card[index]["name"].toString(),
                                      fontSize: 15,
                                      color: ColorManager.blackColor,
                                      padding: 0)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                              child: Image.asset(IconsAssets.radioDisabledLogo),
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 4],
                radius: const Radius.circular(20).w,
                color: Colors.black,
                strokeWidth: 1,
                child: GestureDetector(
                  onTap: () {
                    debugPrint("add card");
                    Get.toNamed("/AddPaymentScreen");
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Image.asset(IconsAssets.addCircleLogo, height: 30),
                    ),
                  ),
                )),
            DesignText(
                text: "Total payment",
                fontSize: 18,
                color: ColorManager.blackColor,
                padding: 8),
            Container(
              margin: const EdgeInsets.only(top: 10).r,
              padding: const EdgeInsets.all(13).w,
              width: double.infinity,
              height: 105.h,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorManager.grey400Color, width: 1.5),
                  borderRadius: BorderRadius.circular(20).w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DesignText(
                          text: "Subtotal: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                          padding: 0),
                      DesignText(
                          text: "\$483 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                          padding: 0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DesignText(
                          text: "Shipping: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                          padding: 0),
                      DesignText(
                          text: "\$17 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                          padding: 0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DesignText(
                          text: "BagTotal: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                          padding: 0),
                      DesignText(
                          text: "\$500 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                          padding: 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlackButton(
          width: 100,
          height: 50,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: ColorManager.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(20.0).w)),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      height: 250.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CrcleAvatar(
                              radius: 35,
                              color: ColorManager.blackColor,
                              child:
                                  Image.asset(IconsAssets.payLogo)),
                          DesignText(text: "Successful !", fontSize: 20, color: ColorManager.blackColor, padding: 0),
                          Text(
                            "You have successfully your confirm payment send!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(175.w, 30.h),
                                backgroundColor: ColorManager.blackColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20).w)),
                            onPressed: () {
                              Get.offAllNamed("/HomePage");
                            },
                            child: Text(
                              "Continue Shopping",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          buttonName: "Pay",
          borderRadius: 20,
        ),
      ),
    );
  }
}
