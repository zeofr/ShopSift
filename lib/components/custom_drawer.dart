import 'package:flutter/material.dart';
import 'dart:ui'; // For blur effect
import 'package:flutter/services.dart'; // For exiting the app

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Screen dimensions for dynamic padding, margins, etc.
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth*.8,
      child: Stack(
        children: [
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.7), // Semi-transparent background
            ),
          ),
          Column(
            children: [
              // Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8), // Use primary color from theme
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Catalogue App',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              // List of Drawer Items
              ListTile(
                leading: Icon(Icons.info, color: Theme.of(context).iconTheme.color),
                title: Text('About Us', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  Navigator.pushNamed(context, '/aboutus');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Theme.of(context).iconTheme.color),
                title: Text('Settings', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.admin_panel_settings_sharp, color: Theme.of(context).iconTheme.color),
                title: Text('Admin', style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/adminpage');
                },
              ),
              // Exit Button
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.exit_to_app, color: Colors.white),
                  label: Text('Exit', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                   // primary: Colors.red, // Exit button color
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop(); // Exit the app
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

