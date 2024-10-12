import 'package:get/get.dart';

// Pastikan CartItem sudah didefinisikan di atas
class CartItem {
  final String image;
  final String name;
  final int price;
  final String date;
  final int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.quantity,
  });
}

class CartController extends GetxController {
  // Menggunakan RxList untuk memungkinkan perubahan reaktif
  var cartItems = <CartItem>[
    CartItem(
      image: 'assets/images/img2.png',
      name: 'Ayam Bakar',
      price: 20000,
      date: '29/11/24 15:00',
      quantity: 2,
    ),
    CartItem(
      image: 'assets/images/img3.jpeg',
      name: 'Onion Ring',
      price: 15000,
      date: '29/11/24 12:00',
      quantity: 1,
    ),
  ].obs;

  // Menghitung subtotal berdasarkan item dalam keranjang
  int get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Menghitung pajak dan biaya
  double get taxAndFees {
    return subtotal * 0.1; // Contoh pajak 10%
  }

  // Biaya pengiriman tetap
  int get delivery {
    return 15000;
  }

  // Menghitung total
  int get total {
    return subtotal + taxAndFees.toInt() + delivery;
  }
}
