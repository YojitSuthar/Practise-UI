import 'package:flutter/material.dart';
import 'package:ecommerce/resources/resources.dart';

class AllProduct extends StatelessWidget {
  //its will give the list of all product which is available in store and purchasable
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 20,
        // width / height: fixed for *all* items
        childAspectRatio: 0.55,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("Product Category");
              },
              child: Container(
                height: 200,
                width: 170,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20)),
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
            const Text(
              "Roller Rabit",
              style: TextStyle(
                  fontFamily: "Varela", fontWeight: FontWeightManager.bold),
            ),
            const Text("Vado Odells Dress"),
            const Text("&198.00")
          ],
        );
      },
    );
  }
}
