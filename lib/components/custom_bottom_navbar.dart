import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String centerText; // The text to be displayed at the center

  CustomBottomNavBar({required this.centerText});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent, // Use the theme color
      shape: CircularNotchedRectangle(), // Provides a notch for a floating action button
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Left Icon (Menu)
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/menu');
            },
          ),
          // Center Text
          Text(
            centerText,
            style: Theme.of(context).textTheme.bodyLarge, // Uses theme text style
          ),
          // Right Icon (Cart)
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Define action for cart button                onTap: () {
                  Navigator.pushReplacementNamed(context, '/cartpage');
            },
          ),
        ],
      ),
    );
  }
}
