import 'package:get/get.dart';

class CanorController extends GetxController {
  var selectedReason = ''.obs;

  // List of cancellation reasons
  List<String> reasons = [
    'Alamat yang digunakan salah',
    'Ingin mengubah pesanan',
    'Penjual tidak membalas chat',
    'Ingin merubah metode pembayaran',
    'Berubah pikiran'
  ];

  // Method to select a reason
  void selectReason(String reason) {
    selectedReason.value = reason;
  }
}
