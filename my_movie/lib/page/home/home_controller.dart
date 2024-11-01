import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  changeCount(int val);
}

class HomeControllerImo extends HomeController {
  int count = 0;
  List<String> titleAppBare = [
    "Movies",
    "Tv series",
    "Documentary",
    "Sports",
  ];

  @override
  changeCount(int val) {
    count = val;
    update();
  }
}
