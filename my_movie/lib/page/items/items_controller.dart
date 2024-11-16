import 'package:get/get.dart';
import 'package:my_movie/core/class/curd.dart';
import 'package:my_movie/core/class/status_request.dart';
import 'package:my_movie/core/model/mod_model.dart';

abstract class ItemsController extends GetxController {
  getRelatedMovie();
}

class ItemsControllerImp extends ItemsController {
  Curd curd = Curd();
  StatusRequest statusRequest = StatusRequest.none;
  OmdModel? omdModel;
  int? i;
  List<OmdModel> movies = [];
  @override
  void onInit() {
    omdModel = Get.arguments['item'];
    getRelatedMovie();
    super.onInit();
  }

  @override
  getRelatedMovie() async {
    List<String> d = omdModel!.title!.split(" ");

    String movieName = d[0] == "The" ? d[1] : d[0];

    statusRequest = StatusRequest.loading;
    update();
    var request = await curd.getData(
        "https://www.omdbapi.com/?i=tt3896198&apikey=e10789be&s=$movieName");
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
}
