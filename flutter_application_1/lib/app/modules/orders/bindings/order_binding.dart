import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/orders/controllers/order_controller.dart';


class OrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
