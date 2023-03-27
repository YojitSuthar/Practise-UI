import 'package:flutter/material.dart';

import 'resources/assets_manager.dart';
import 'resources/style_manager.dart';


class ok extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 24,
          // width / height: fixed for *all* items
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index){
          return  Column(
            children: [
              GestureDetector(
                onTap: (){debugPrint("Product Category");},
                child: Container(
                  height: 200,
                  width: 170,
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
              Text(
                "Roller Rabit",
                style: TextStyle(fontFamily: "Varela",fontWeight: FontWeightManager.bold),
              ),
              Text("Vado Odells Dress"),
              Text("&198.00")
            ],
          );
        },
      ),
    );

  }
}