import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/settings/settings_controller.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/image_asset.dart';

class SettingsScreen extends GetView<SettingsControllerImp> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //! header

            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width / 2.4,
                  color: AppColors.mainColor,
                ),
                Positioned(
                  top: Get.width / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      backgroundImage: const AssetImage(ImageAsset.drone),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),

            //! Body
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  GetBuilder<SettingsControllerImp>(
                    builder: (changeLang) {
                      return ListTile(
                        title: const Text("عربي / Arabic"),
                        contentPadding: const EdgeInsets.all(10),
                        trailing: Switch(
                          onFocusChange: (val) {
                            changeLang.changeLanguage();
                          },
                          value: controller.isArabic,
                          onChanged: (val) async {
                            await changeLang.changeLanguage();
                          },
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text("closeNotification".tr),
                    contentPadding: const EdgeInsets.all(10),
                    trailing: Switch(value: false, onChanged: (val) {}),
                    onTap: () {},
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text("addresses".tr),
                    contentPadding: const EdgeInsets.all(10),
                    trailing: const Icon(Icons.location_on_outlined),
                    onTap: () {
                      Get.toNamed(AppRoutes.address);
                    },
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text("contactUs".tr),
                    contentPadding: const EdgeInsets.all(10),
                    trailing: const Icon(Icons.email_outlined),
                    onTap: () {},
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text("aboutApp".tr),
                    contentPadding: const EdgeInsets.all(10),
                    trailing: const Icon(Icons.info_outline),
                    onTap: () {},
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    title: Text("logout".tr),
                    contentPadding: const EdgeInsets.all(10),
                    trailing: const Icon(Icons.logout_outlined),
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
