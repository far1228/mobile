import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/payments/controllers/payment_controller.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int _selectedIndex = 0;

  // List of pages for each bottom navigation item
  static List<Widget> _pages = <Widget>[
    PaymentViewContent(), // Isi halaman utama
    Center(child: Text('Favorites')), // Placeholder untuk halaman favorite
    Center(child: Text('Profile')), // Placeholder untuk halaman profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Order Details'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      body: _pages.elementAt(_selectedIndex), // Menampilkan halaman sesuai dengan indeks yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped, // Update halaman saat item dipilih
      ),
    );
  }
}

// Konten dari halaman PaymentView
class PaymentViewContent extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Kurangi padding
                child: Column(
                  children: [
                    Obx(() => Column(
                          children: controller.items.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item['name']?.toString() ?? '', style: TextStyle(fontSize: 16)),
                                  Text('${item['quantity']} items', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            );
                          }).toList(),
                        )),
                    Divider(),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('Rp ${controller.totalAmount.value}',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Icon(Icons.qr_code),
                title: Obx(() => Text(controller.paymentMethod.value)),
                trailing: Text('Rp ${controller.totalAmount.value}'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text('Scan Here', style: TextStyle(color: Colors.red)),
                  SizedBox(height: 16),
                  QRCodeWidget(), // Panggil widget QR Code yang menampilkan gambar dari assets
                ],
              ),
            ),
            SizedBox(height: 16), // Tambahkan jarak di bawah QR code
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showCancelOrderDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color merah untuk tombol cancel
                ),
                child: Text('Cancel Order', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'After 5 minutes you can’t cancel the order',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content: Text('Are you sure you want to cancel this order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Logic untuk membatalkan pesanan bisa ditambahkan di sini
                Navigator.of(context).pop(); // Close dialog setelah pesanan dibatalkan
                Get.snackbar('Order Cancelled', 'Your order has been successfully cancelled.',
                    backgroundColor: Colors.red, colorText: Colors.white);
              },
              child: Text('Yes', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

// Widget untuk menampilkan QR Code
class QRCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/img1.jpeg', // Pastikan jalur ini sesuai
      width: 200.0,
      height: 200.0,
    );
  }
}
