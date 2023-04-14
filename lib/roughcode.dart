// import 'package:flutter/material.dart';
//
//
// class random extends StatelessWidget {
//   const random({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//       padding: const EdgeInsets.only(top: 20).r,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: 280.0.w,
//             height: 45.0.h,
//             decoration: BoxDecoration(
//                 color: RGBColorManager.rgbWhiteColor,
//                 borderRadius: BorderRadius.circular(20.w)),
//             child: Row(
//               children: [
//                 IcnButton(
//                     onPressed: () {
//                       debugPrint("search icon");
//                       Get.to(SearchProduct(searchText: searchCtrl.text.trim(),));
//                       searchCtrl.text="";
//                     },
//                     iconSize: 0,
//                     child: SizedBox(
//                       height: 25,
//                       child: Image.asset(
//                         IconsAssets.searchLogo,
//                       ),
//                     )),
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchCtrl,
//                     cursorHeight: 24,
//                     cursorRadius: const Radius.circular(10).w,
//                     cursorColor: ColorManager.blackColor,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding:
//                       const EdgeInsets.only(left: 11).r,
//                       hintText: "Search",
// // border: OutlineInputBorder(),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           IcnButton(
//               iconSize: 0,
//               onPressed: () {
//                 Get.toNamed("/FilterScreen");
//               },
//               child: CrcleAvatar(
//                 radius: 23,
//                 color: ColorManager.blackColor,
//                 child: Image.asset(
//                   IconsAssets.filterLogo,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
