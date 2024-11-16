import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/page/items/items_controller.dart';

class ContainerShowMovie extends StatelessWidget {
  final ItemsControllerImp controller;
  const ContainerShowMovie({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Image.network(
            controller.omdModel!.poster!,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//https://api.themoviedb.org/3/movie/1118031/images/gwNm3D4hj1xQvEmfZh2Sssok3EU.jpg
//https://api.themoviedb.org/3/discover/movie