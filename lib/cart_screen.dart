import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalAmount = cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );

    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text(
                          '₹${item['price']} x ${item['quantity']} = ₹${item['price'] * item['quantity']}',
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Total: ₹$totalAmount', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Payment Successful'),
                        content: Text('Thank you for your purchase!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
