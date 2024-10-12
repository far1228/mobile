// lib/models/cart_item.dart

class OrderItem {
  final String name;      // Name of the item
  int quantity;           // Quantity of the item
  final double price;     // Price of a single item
  final String imageUrl;  // Image URL for the item
  final DateTime date;    // Date when the item was added

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.date,
  });

  // Calculate total price for the item based on quantity
  double get totalPrice => quantity * price;
}
