import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/payments/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
