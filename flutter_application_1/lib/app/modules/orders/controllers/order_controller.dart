import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderController extends GetxController {
  var items = <Map<String, dynamic>>[].obs;
  File? selectedImage;

  OrderController() {
    items.addAll([
      {
        "name": "Ayam Bakar",
        "time": "29 Nov, 16:30 pm",
        "price": 20000,
        "quantity": 2,
        "image": "assets/images/img2.png", // Menambahkan jalur gambar
      },
      {
        "name": "Onion Ring",
        "time": "29 Nov, 12:00 pm",
        "price": 15000,
        "quantity": 1,
        "image": "assets/images/img3.jpeg", // Menambahkan jalur gambar
      },
    ]);
  }

  // Method untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
  }

  double get subtotal => items.fold(0.0, (sum, item) {
    final price = (item['price'] as int?) ?? 0;
    final quantity = (item['quantity'] as int?) ?? 0;
    return sum + (price * quantity);
  });

  double get taxAndFees => 5500.0;
  double get delivery => 15000.0;
  double get total => subtotal + taxAndFees + delivery;

  void removeItem(int index) {
    if (items.isNotEmpty && index >= 0 && index < items.length) {
      items.removeAt(index);
      update();
    } else {
      print("Indeks tidak valid atau list kosong");
    }
  }
}
