import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/cancelled/controllers/cancel_controller.dart';

class CancelBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelController>(() => CancelController());
  }
}
