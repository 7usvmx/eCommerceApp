// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shop/controller/api/crudController.dart';
// import 'package:shop/core/classes/handling_data_view.dart';
// import 'package:shop/core/constants/colors.dart';
// import 'package:shop/core/constants/image_asset.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(CrudControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GetBuilder<CrudControllerImp>(
//                 builder: (c) {
//                   return HandlingDataView(
//                     statusRequest: c.statusRequest,
//                     widget: Expanded(
//                       child: ListView.builder(
//                         itemCount: c.data.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               Lottie.asset(ImageAsset.done),
//                               Text("${c.data}"),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
