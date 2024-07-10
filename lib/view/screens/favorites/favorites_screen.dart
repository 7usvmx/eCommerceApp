import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/favorites/favorite_controller.dart';
import 'package:shop/controller/favorites/favorites_page_controller.dart';
import 'package:shop/core/classes/handling_data_view.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/functions/translate_data_from_database.dart';
import 'package:shop/view/widgets/home/search_and_notifications.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesPageControllerImp());
    FavoriteControllerImp favCon = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<FavoritesPageControllerImp>(
                builder: (controller) {
                  return ListView(
                    children: [
                      // const SearchAndNotifications(),
                      HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.favoritesList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18.0,
                                vertical: 5,
                              ),
                              child: ListTile(
                                onTap: () {
                                  // productsController
                                  // .goToProductDetails(productsModel);
                                },
                                title: Text(
                                  translate(
                                    controller.services,
                                    "${controller.favoritesList[index].arProductName}",
                                    "${controller.favoritesList[index].enProductName}",
                                  ),
                                ),
                                subtitle: Text(
                                  "\$${controller.favoritesList[index].productPrice}",
                                ),
                                leading: Container(
                                  decoration: const BoxDecoration(),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${controller.favoritesList[index].productImage}",
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                tileColor: AppColors.grey200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    favCon.delFromFav(
                                      controller
                                          .favoritesList[index].productID!,
                                      controller.services.sharedPref
                                          .getString("id")!,
                                    );
                                    controller.removeFav(index);
                                    print(controller.favoritesList);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
