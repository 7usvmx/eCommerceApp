import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/messages/alerting_messages.dart';

class SearchAndNotifications extends StatelessWidget {
  final Function onChanged;
  final Function searchForProducts;
  final TextEditingController searchText;
  const SearchAndNotifications({
    super.key,
    required this.onChanged,
    required this.searchText,
    required this.searchForProducts,
  });

  @override
  Widget build(BuildContext context) {
    // HomeControllerImp controller = Get.put(HomeControllerImp());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                // controller.goToProductDetails();
                Get.toNamed(AppRoutes.favorites);
              },
              icon: Icon(
                Icons.favorite_border,
                size: 38,
                color: AppColors.grey600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 38,
                color: AppColors.grey600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: searchText,
              onChanged: (val) {
                onChanged(val);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    searchForProducts();
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                ),
                hintText: MainUi.search,
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintFadeDuration: const Duration(milliseconds: 350),
                filled: true,
                fillColor: AppColors.grey200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
