import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/home/home_controller.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/core/services/services.dart';
import 'package:shop/data/model/products_model.dart';

class SearchScreen extends GetView<HomeControllerImp> {
  final List<ProductsModel> searchedData;
  final Services servicesController;
  const SearchScreen(
      {super.key,
      required this.searchedData,
      required this.servicesController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchedData.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  controller.goToProductDetails(searchedData[index]);
                },
                leading: Container(
                  child: CachedNetworkImage(
                    imageUrl: searchedData[index].productImage!,
                    height: 50,
                    width: 50,
                  ),
                ),
                title: Text(
                  translate(
                    servicesController,
                    searchedData[index].arProductName!,
                    searchedData[index].enProductName!,
                  ),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  searchedData[index].productPrice!,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
