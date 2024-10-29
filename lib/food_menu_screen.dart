import 'package:flutter/material.dart';
import 'cart_screen.dart';

class FoodMenuScreen extends StatefulWidget {
  final String hotelName;
  final String category;
  final List<Map<String, dynamic>> cart;

  FoodMenuScreen({
    required this.hotelName,
    required this.category,
    required this.cart,
  });

  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  final Map<String, List<Map<String, dynamic>>> menuByCategory = {
    'Veg': [
      {'name': 'Veg Biryani', 'price': 120},
      {'name': 'Paneer Butter Masala', 'price': 180},
      {'name': 'Aloo Gobi', 'price': 100},
      {'name': 'Dal Tadka', 'price': 150},
      {'name': 'Chole Bhature', 'price': 130},
    ],
    'Non-Veg': [
      {'name': 'Chicken Biryani', 'price': 150},
      {'name': 'Mutton Curry', 'price': 200},
      {'name': 'Fish Fry', 'price': 250},
      {'name': 'Egg Curry', 'price': 120},
      {'name': 'Prawn Masala', 'price': 280},
    ],
    'Snacks': [
      {'name': 'Samosa', 'price': 30},
      {'name': 'Pakora', 'price': 40},
      {'name': 'Paneer Tikka', 'price': 120},
      {'name': 'French Fries', 'price': 60},
      {'name': 'Spring Rolls', 'price': 80},
    ],
    'Drinks': [
      {'name': 'Coke', 'price': 40},
      {'name': 'Pepsi', 'price': 40},
      {'name': 'Lemonade', 'price': 30},
      {'name': 'Mango Juice', 'price': 50},
      {'name': 'Iced Tea', 'price': 60},
    ],
  };

  Map<String, int> quantities = {};

  @override
  void initState() {
    super.initState();
    menuByCategory[widget.category]?.forEach((item) {
      quantities[item['name']] = 0;
    });
  }

  void addToCart(Map<String, dynamic> item) {
    final quantity = quantities[item['name']] ?? 0;

    if (quantity > 0) {
      setState(() {
        widget.cart.removeWhere((cartItem) => cartItem['name'] == item['name']);
        widget.cart.add({
          'name': item['name'],
          'price': item['price'],
          'quantity': quantity,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item['name']} added to cart')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a quantity greater than 0')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = menuByCategory[widget.category] ?? [];

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: Text('Menu - ${widget.hotelName} (${widget.category})'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: widget.cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final itemName = item['name'];
          final itemPrice = item['price'];

          return Center(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Container(
                width: 300, // Set a fixed width for each card
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the items
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '₹$itemPrice',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantities[itemName]! > 0) {
                                quantities[itemName] = quantities[itemName]! - 1;
                              }
                            });
                          },
                        ),
                        Text(
                          quantities[itemName].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantities[itemName] = quantities[itemName]! + 1;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        addToCart(item);
                      },
                      child: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
