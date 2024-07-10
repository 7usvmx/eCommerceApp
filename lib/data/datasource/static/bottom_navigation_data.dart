import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/data/model/bottom_navigation.dart';

List<BottomNavigation> navigation = [
  BottomNavigation(
    title: "home".tr,
    icon: Icons.home_outlined,
  ),
  BottomNavigation(
    title: "searchBottomAppBar".tr,
    icon: Icons.search,
  ),
  BottomNavigation(
    title: "favBottomAppBar".tr,
    icon: Icons.favorite_border,
  ),
  BottomNavigation(
    title: "settingBottomAppBar".tr,
    icon: Icons.settings_outlined,
  ),
];
