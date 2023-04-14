import 'package:ecommerce/provider/apiproductdata.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../services/api_constants.dart';
import '../reuse_widget/reuse_widget.dart';
import '../screens.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key, this.searchText}) : super(key: key);
  String? searchText;

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  void getData() {
    final searchData = Provider.of<SearchProductData>(context, listen: false);
    searchData.searchData(APIConstants.searchURL + widget.searchText!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIconButton(
                topPadding: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DesignText(
                    color: ColorManager.blackColor,
                    padding: 10,
                    text: "Search product",
                    fontSize: 18,
                  ),
                  DesignText(
                    color: ColorManager.blackColor,
                    padding: 10,
                    text: "Result",
                    fontSize: 15,
                  ),
                ],
              ),
              Expanded(
                child: Consumer<SearchProductData>(builder: (context, value, child) {
                  return value.loading?const CardShimmer():ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount: value.searchProductData.length,
                      itemBuilder: (BuildContext context, index) {
                        return SizedBox(
                          height: 125.h,
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: (){
                              debugPrint("search screen");
                              Get.to(ProductDetailsView(index: index,model: value.searchProductData,));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10).r,
                              padding: const EdgeInsets.only(left: 7).r,
                              decoration: BoxDecoration(
                                  color: RGBColorManager.rgbWhiteColor,
                                borderRadius: BorderRadius.circular(17).w
                              ),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8).w,
                                  child: Container(
                                    width: 90.w,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage( value.searchProductData[index].thumbnail!,)
                                      ),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20).w
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5).w,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Name:- ${value.searchProductData[index].title}",
                                          softWrap: true,
                                        ),
                                        Text(
                                            "Price_- ${value.searchProductData[index].price}"),
                                        Text(
                                            "Discount:- ${value.searchProductData[index].discountPercentage}"),
                                        Text(
                                            "Brand:- ${value.searchProductData[index].brand}"),
                                        Text(
                                            "${value.searchProductData[index].category}"),
                                      ]),
                                )
                              ]),
                            ),
                          ),
                        );
                      });
                }),
              )
            ],
          )),
    );
  }
}
