import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/page/items/items_controller.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImp());

    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
              controller.omdModel!.title!,
              style: const TextStyle(color: Colors.red),
            ),
            Text(
              controller.i.toString(),
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
