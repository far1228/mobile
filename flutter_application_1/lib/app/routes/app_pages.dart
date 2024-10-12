import 'package:flutter_application_1/app/modules/details/bindings/detail_binding.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/cart/bindings/cart_binding.dart';
import 'package:flutter_application_1/app/modules/cart/views/cart_view.dart'; // Sesuaikan dengan nama file view
import 'package:flutter_application_1/app/modules/orders/bindings/order_binding.dart';
import 'package:flutter_application_1/app/modules/orders/views/order_view.dart'; // Sesuaikan dengan nama file view
import 'package:flutter_application_1/app/modules/details/views/detail_view.dart'; // Sesuaikan dengan nama file view

class AppPages {
  static const INITIAL = '/cart'; // Mulai dari Cart

  static final routes = [
    GetPage(
      name: '/cart',
      page: () => CartView(), // CartView yang berada di cart_view.dart
      binding: CartBinding(),
    ),
    GetPage(
      name: '/orders',
      page: () => OrderView(), // OrdersView yang berada di orders_view.dart
      binding: OrderBindings(),
    ),
    GetPage(
      name: '/details',
      page: () => DetailsView(), // DetailsView yang berada di details_view.dart
      binding: DetailsBindings(),
    ),
    // Tambahkan halaman lain sesuai kebutuhan
  ];
}
