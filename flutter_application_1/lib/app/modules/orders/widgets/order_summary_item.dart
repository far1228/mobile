import 'package:flutter/material.dart';

class OrderSummaryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onCancel;

  const OrderSummaryItem({
    Key? key,
    required this.item,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Menampilkan gambar
            Image.asset(
              item['image'],
              width: 50, // Ukuran gambar
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Price: Rp ${item['price']}"),
                  Text("Quantity: ${item['quantity']}"),
                  Text(item['time']),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onCancel, // Fungsi untuk menghapus item
            ),
          ],
        ),
      ),
    );
  }
}
