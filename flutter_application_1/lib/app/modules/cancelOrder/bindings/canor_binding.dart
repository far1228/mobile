import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/cancelOrder/controllers/canor_controller.dart';

class CanorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CanorController>(() => CanorController());
  }
}
