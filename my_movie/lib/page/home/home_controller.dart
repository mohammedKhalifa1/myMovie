import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/core/class/curd.dart';
import 'package:my_movie/core/class/route_name.dart';
import 'package:my_movie/core/class/status_request.dart';
import 'package:my_movie/core/model/mod_model.dart';
import 'package:my_movie/page/home/widget/page/favorite_page.dart';
import 'package:my_movie/page/home/widget/page/home_page_widget.dart';
import 'package:my_movie/page/home/widget/page/setting_page.dart';

abstract class HomeController extends GetxController {
  changeCount(int val);
  functionMovie();
  functionTvSeries();
  functionDocumentary();
  functionSports();
  changeIndexAppBare(int val);
  goToItemsDetails(OmdModel omdbapi, int i);
}

class HomeControllerImo extends HomeController {
  int indexAppBare = 0;
  Curd curd = Curd();
  List<OmdModel> movies = [];
  List<Widget> pages = [
    const HomePageWidget(),
    const FavoritePage(),
    const SettingPage(),
  ];
  List<P> bottomNavigation = [
    P(
      Icons.home,
      () {},
      "Home",
    ),
    P(
      Icons.favorite,
      () {},
      "favorite",
    ),
    P(
      Icons.exit_to_app,
      () {},
      "Home",
    )
  ];
  int count = 0;
  List<String> titleAppBare = [
    "Movies",
    "Tv series",
    "Documentary",
    "Sports",
  ];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  changeCount(int val) {
    count = val;
    update();
  }

  @override
  functionMovie() async {
    statusRequest = StatusRequest.loading;
    movies.clear();
    update();
    var request = await curd.getData(
        "https://www.omdbapi.com/?i=tt3896198&apikey=e10789be&s=movies");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      statusRequest = StatusRequest.success;
      List d = data['Search'];
      // movies.addAll(d.map(
      //   (e) => OmdModel.fromJson(e),
      // ));
      for (var element in d) {
        movies.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }

  @override
  functionDocumentary() async {
    statusRequest = StatusRequest.loading;
    movies.clear();
    update();
    var request = await curd.getData(
        "https://www.omdbapi.com/?i=tt3896198&apikey=e10789be&s=documentary");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      movies.clear;
      statusRequest = StatusRequest.success;
      for (var element in data['Search']) {
        movies.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }

  @override
  functionSports() async {
    statusRequest = StatusRequest.loading;
    movies.clear();
    update();
    var request = await curd.getData(
        "https://www.omdbapi.com/?i=tt3896198&apikey=e10789be&s=sports");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      statusRequest = StatusRequest.success;
      for (var element in data['Search']) {
        movies.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }

    update();
  }

  @override
  functionTvSeries() async {
    statusRequest = StatusRequest.loading;
    movies.clear();
    update();
    var request = await curd.getData(
        "https://www.omdbapi.com/?i=tt3896198&apikey=e10789be&s=tv+series");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      statusRequest = StatusRequest.success;
      List d = data['Search'];
      for (var element in d) {
        movies.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }

  @override
  void onInit() {
    functionMovie();
    super.onInit();
  }

  @override
  changeIndexAppBare(val) {
    indexAppBare = val;
    update();
  }

  @override
  goToItemsDetails(OmdModel omdbapi, i) {
    Get.toNamed(RouteName.items, arguments: {'item': omdbapi, "i": i});

    update();
  }
}

class P {
  String title;
  IconData iconData;
  VoidCallback onTap;
  P(this.iconData, this.onTap, this.title);
}
