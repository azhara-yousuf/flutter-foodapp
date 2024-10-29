import 'package:flutter/material.dart';
import 'category_selection_screen.dart';
import 'food_menu_screen.dart';

class HotelSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Broken Bridge',
      'categories': ['Veg', 'Non-Veg', 'Snacks', 'Drinks'],
      'image': 'assets/broken_bridge.jpg', // Sample image path
    },
    {
      'name': 'Arabian Choola',
      'categories': ['Veg', 'Non-Veg', 'Snacks', 'Drinks'],
      'image': 'assets/arabian_choola.jpg',
    },
    {
      'name': 'Mystery Groove',
      'categories': ['Veg', 'Non-Veg', 'Snacks', 'Drinks'],
      'image': 'assets/mystery_groove.jpg',
    },
    {
      'name': 'Southern Spice',
      'categories': ['Veg', 'Non-Veg', 'Snacks', 'Drinks'],
      'image': 'assets/southern_spice.jpg',
    },
    {
      'name': 'Woodworks',
      'categories': ['Veg', 'Non-Veg', 'Snacks', 'Drinks'],
      'image': 'assets/woodworks.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Select a Hotel',
            style: TextStyle(fontSize: 24),
          ),
        ),
        automaticallyImplyLeading: false, // Prevents default back button
      ),
      body: Center( // Center the list on the screen
        child: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            final hotel = hotels[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  leading: Image.asset(
                    hotel['image'],
                    width: 50.0, // Width of the image
                    height: 50.0, // Height of the image
                    fit: BoxFit.cover, // Cover fit for the image
                  ),
                  title: Text(
                    hotel['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Navigate to category selection for the selected hotel
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategorySelectionScreen(
                          hotelName: hotel['name'],
                          categories: hotel['categories'],
                          cart: [],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
