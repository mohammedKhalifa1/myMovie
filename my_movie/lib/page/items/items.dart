import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_movie/page/items/items_controller.dart';
import 'package:my_movie/page/items/widget/details_movie.dart';

import 'widget/container_show_widget.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImp());

    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerShowMovie(
                controller: controller,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsMovie(
                      controller: controller,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Related Movies",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            //_____________________
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
