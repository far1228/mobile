import 'package:get/get.dart';

class PaymentController extends GetxController {
  var items = [
    {'name': 'Ayam Bakar', 'quantity': 2},
    {'name': 'Onion Ring', 'quantity': 1}
  ].obs;

  var totalAmount = 75500.obs;
  var paymentMethod = 'QR Code'.obs;
}
