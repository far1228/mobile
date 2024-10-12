import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/cancelOrder/controllers/canor_controller.dart';

class CanorView extends StatelessWidget {
  final CanorController controller = Get.find<CanorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: const Text('Cancel Order', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF3E9B5), // Changed container color to #F3E9B5
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mohon pilih alasan pembatalan. Pesananmu akan langsung dibatalkan setelah alasan pembatalan diajukan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: controller.reasons.map((reason) {
                return RadioListTile<String>(
                  title: Text(reason),
                  value: reason,
                  groupValue: controller.selectedReason.value,
                  onChanged: (value) {
                    controller.selectReason(value!);
                  },
                );
              }).toList(),
            )),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Others reason...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.selectReason(value);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE95322), // Changed submit button color to #E95322
                ),
                onPressed: () {
                  // Handle form submission
                  if (controller.selectedReason.value.isNotEmpty) {
                    // Logika untuk memproses pembatalan, misalnya, menyimpan ke database
                    Get.back(); // Kembali ke OrderView setelah pengajuan pembatalan
                  } else {
                    // Tampilkan pesan kesalahan jika alasan tidak dipilih
                    Get.snackbar('Error', 'Please select a reason for cancellation.',
                      snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange[400], // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
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
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
