import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/page/home/home_controller.dart';
import 'package:my_movie/page/home/widget/bottom_navigation_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImo controller2 = Get.put(HomeControllerImo());
    return SafeArea(
      child: GetBuilder<HomeControllerImo>(
        builder: (controller) => Scaffold(
          bottomNavigationBar: AbbPareTow(
            i: controller2.indexAppBare,
            data: controller2.bottomNavigation,
          ),
          body: controller.pages.elementAt(controller.indexAppBare),
        ),
      ),
    );
  }
}
