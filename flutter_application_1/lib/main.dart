import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/cart/bindings/cart_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Your App",
      debugShowCheckedModeBanner: false,
      initialBinding: CartBinding(), // Binding awal untuk Cart
      initialRoute: AppPages.INITIAL, // Route awal ke CartView
      getPages: AppPages.routes,      // Routes didefinisikan di AppPages
      home: null, // Tidak diperlukan karena kita menggunakan initialRoute
    );
  }
}
