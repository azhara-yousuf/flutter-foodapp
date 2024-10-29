import 'package:assignment/cart_screen.dart';
import 'package:flutter/material.dart';
import 'food_menu_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  final String hotelName;
  final List<Map<String, dynamic>> cart; // Cart passed from the previous screen

  CategorySelectionScreen({
    required this.hotelName,
    required this.cart,
    required categories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          
          '$hotelName - Select Category',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Center the title
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black), // Set cart icon color
            onPressed: () {
              // Show cart details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
          children: [
            buildCategoryButton(
              context: context,
              category: 'Veg',
              image: 'assets/veg_icon.png', // Original image path
            ),
            buildCategoryButton(
              context: context,
              category: 'Non-Veg',
              image: 'assets/non_veg_icon.png', // Original image path
            ),
            buildCategoryButton(
              context: context,
              category: 'Snacks',
              image: 'assets/snacks_icon.png', // Original image path
            ),
            buildCategoryButton(
              context: context,
              category: 'Drinks',
              image: 'assets/drinks_icon.png', // Original image path
            ),
          ],
        ),
      ),
    );
  }

  // A reusable widget for each category button
  Widget buildCategoryButton({
    required BuildContext context,
    required String category,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuScreen(
                hotelName: hotelName,
                category: category,
                cart: cart,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 250, // Increased width to accommodate content
          height: 100, // Fixed height
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  image,
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10), // Spacing between image and text
              Flexible(
                flex: 2,
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevent text overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
