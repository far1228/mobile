import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/details/controllers/detail_controller.dart';

class DetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
