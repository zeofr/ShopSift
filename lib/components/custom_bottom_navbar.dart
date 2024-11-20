// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final String centerText; // The text to be displayed at the center

//   CustomBottomNavBar({required this.centerText});

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.transparent, // Use the theme color
//       shape: CircularNotchedRectangle(), // Provides a notch for a floating action button
//       notchMargin: 8.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           // Left Icon (Menu)
//           IconButton(
//             icon: Icon(Icons.home_filled),
//              onPressed: () {//;
//                Navigator.pushReplacementNamed(context, '/shoppage');
//             },
//           ),
//           // Center Text
//           Text(
//             centerText,
//             style: Theme.of(context).textTheme.bodyLarge, // Uses theme text style
//           ),
//           // Right Icon (Cart)
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Define action for cart button                onTap: () {
//                   Navigator.pushReplacementNamed(context, '/cartpage');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int _selectedIndex = 0;

//   void _navigateTo(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/shoppage');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/cartpage');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: screenHeight * .01, horizontal: screenWidth * .23),
//       color: Colors.transparent,
//       child: GNav(
//         backgroundColor: Colors.transparent,
//         color: Theme.of(context).colorScheme.primary,
//         activeColor: Theme.of(context).colorScheme.inversePrimary,
//         tabBackgroundColor: Theme.of(context).colorScheme.surface,
//         selectedIndex: _selectedIndex,
//         onTabChange: (index) {
//           _navigateTo(index);
//         },
//         tabs: [
//           GButton(
//             icon: Icons.home_outlined,
//             text: 'Shop',
//           ),
//           GButton(
//             icon: Icons.shopping_cart_outlined,
//             text: 'Cart',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../providers/navigation_provider.dart'; // Import the provider

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  void _navigateTo(BuildContext context, int index) {
    final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    navigationProvider.setIndex(index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/shoppage');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/cartpage');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final selectedIndex = Provider.of<NavigationProvider>(context).selectedIndex;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .01, horizontal: screenWidth * .23),
      color: Colors.transparent,
      child: GNav(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.inversePrimary,
        tabBackgroundColor: Theme.of(context).colorScheme.surface,
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          _navigateTo(context, index);
        },
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
