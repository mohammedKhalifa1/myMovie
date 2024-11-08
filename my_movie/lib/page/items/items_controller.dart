import 'package:get/get.dart';
import 'package:my_movie/core/model/mod_model.dart';

abstract class ItemsController extends GetxController {}

class ItemsControllerImp extends GetxController {
  OmdModel? omdModel;
  int? i;
  @override
  void onInit() {
    omdModel = Get.arguments['item'];
    i = Get.arguments['i'];
    print(Get.arguments['item']);
    print(Get.arguments['i']);
    super.onInit();
  }
}
