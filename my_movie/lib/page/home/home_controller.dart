import 'package:get/get.dart';
import 'package:my_movie/core/class/curd.dart';
import 'package:my_movie/core/class/status_request.dart';
import 'package:my_movie/core/model/mod_model.dart';

abstract class HomeController extends GetxController {
  changeCount(int val);
  movie();
  tvSeries();
  documentary();
  sports();
}

class HomeControllerImo extends HomeController {
  Curd curd = Curd();
  List<OmdModel> movies = [];
  List<OmdModel> listTvSeries = [];
  List<OmdModel> listDocumentary = [];
  List<OmdModel> listSports = [];
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
  movie() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await curd.getData(
        "https://www.omdbapasdi.com/?i=tt3896198&apikey=e10789be&s=movies");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
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
  documentary() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await curd.getData(
        "https://www.omdbapasdi.com/?i=tt3896198&apikey=e10789be&s=documentary");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      for (var element in data['Search']) {
        listDocumentary.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }

  @override
  sports() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await curd.getData(
        "https://www.omdbapasdi.com/?i=tt3896198&apikey=e10789be&s=sports");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      for (var element in data['Search']) {
        listDocumentary.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }

  @override
  tvSeries() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await curd.getData(
        "https://www.omdbapasdi.com/?i=tt3896198&apikey=e10789be&s=tvSeries");
    var data = request.fold((l) => l, (r) => r);
    if (data is Map) {
      for (var element in data['Search']) {
        listDocumentary.add(OmdModel.fromJson(element));
      }
    } else {
      if (data is StatusRequest) {
        statusRequest = data;
      }
    }
    update();
  }
}
