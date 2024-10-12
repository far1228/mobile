import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/orders/controllers/order_controller.dart';
import 'package:flutter_application_1/app/modules/orders/widgets/order_summary_item.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari OrderController
    OrderController controller = Get.put(OrderController());

    return Scaffold(
      backgroundColor: Colors.white, // Background aplikasi
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CB58), // Warna header
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Menengahkan teks
          children: [
            Text(
              'Confirm Order',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi kembali
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return OrderSummaryItem(
                    item: controller.items[index],
                    onCancel: () {
                      // Menghapus item dari daftar pesanan
                      controller.removeItem(index);
                    },
                  );
                },
              )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:', style: TextStyle(fontSize: 16)),
                Text('Rp ${controller.subtotal}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax and Fees:', style: TextStyle(fontSize: 16)),
                Text('Rp ${controller.taxAndFees}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery:', style: TextStyle(fontSize: 16)),
                Text('Rp ${controller.delivery}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Rp ${controller.total}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasi aksi pembayaran
                },
                child: Text('Pay Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black, // Warna item terpilih
        unselectedItemColor: Colors.grey, // Warna item tidak terpilih
        backgroundColor: Color(0xFFE95322), // Warna latar belakang navbar
      ),
    );
  }
}
