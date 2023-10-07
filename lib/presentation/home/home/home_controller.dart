import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../global_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// global controller
  final GlobalController globalController = GlobalController.to;

  /// page view controller
  final PageController pageController = PageController();

  /// sample banner image list
  List<Image> sampleImageList = [
    Assets.jpg.whiskey.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.beer.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.wine.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.soju.image(height: 174, fit: BoxFit.cover),
  ];

// Functions ▼ ------------------------------------------------------

// Life Cycle ▼ ------------------------------------------------------
}
