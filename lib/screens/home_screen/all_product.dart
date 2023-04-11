import 'package:flutter/material.dart';
import 'package:ecommerce/resources/resources.dart';
import '../../provider/apiproductdata.dart';
import '../../resources/import_resources.dart';
import '../screens.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(builder: (context,value,child){
      return GridView.builder(
        itemCount: value.productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 40,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("Product Category");
                  Get.to(ProductDetailsView(imageIndex: index,));
                },
                child: Container(
                  height: 160.h,
                  width: 145.w,
                  margin: const EdgeInsets.only(bottom: 10).r,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(value.productData[index]["thumbnail"]),fit: BoxFit.cover),
                      color: ColorManager.greyOpacityColor,
                      borderRadius: BorderRadius.circular(20).w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(IconsAssets.likeLogo))
                    ],
                  ),
                ),
              ),
              Text(
                value.productData[index]["title"],
                style: const TextStyle(
                    fontFamily: "Varela", fontWeight: FontWeightManager.semiBold),
              ),
               Text(value.productData[index]["brand"].toString()),
              Text("₹${value.productData[index]["price"].toString()}"),
            ],
          );
        },
      );
    });
  }
}
