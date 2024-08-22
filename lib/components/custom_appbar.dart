

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    // Getting the screen size dynamically
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary ), // you can try Theme.of(context).colorTheme.color
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.03, // 5% of screen height for top padding
          left: screenWidth * 0.05, // 5% of screen width for left padding
          right: screenWidth * 0.05, // 5% of screen width for right padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  radius: screenWidth * 0.06, // 6% of screen width for avatar radius
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                    size: screenWidth * 0.06, // 6% of screen width for icon size
                  ),
                ),
                SizedBox(width: screenWidth * 0.03), // 3% of screen width for spacing
                // Text(
                //   "Welcome to\nOptiFlex",
                //   style: TextStyle(
                //     color: Theme.of(context).colorScheme.primary,
                //     fontSize: screenWidth * 0.045, // 4.5% of screen width for font size
                //   ),
                // ),
                Column(children:[
                                  Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: screenWidth * 0.035,
                  ),textAlign: TextAlign.left,),
                                  Text(
                  "OptiFlex",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  )),
                ]),
                Spacer(), // To give space between elements in AppBar
                GestureDetector(
                  onTap: () {
                    Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                  },
                  child:Container(     //Theme Change button
                  padding: EdgeInsets.all(screenWidth * 0.03), // 3% of screen width for padding
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,

                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                     // 4% of screen width for border radius
                  ),
                  
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.white,
                    size: screenWidth * 0.03, // 6% of screen width for icon size
                  ),

                )
                ),
                SizedBox(width: screenWidth * 0.1), // 1% of screen width for spacing (Theme Button)
                // Icon(
                //   Icons.more_vert,
                //   color: Colors.white,
                //   size: screenWidth * 0.07, // 7% of screen width for icon size
                // ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03), // 3% of screen height for spacing
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for Products",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: screenWidth * 0.06, // 6% of screen width for icon size
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04), // 4% of screen width for border radius
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03), // 3% of screen width for spacing
                OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary), // Border color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            //onPressed: () => _//performSearch(context),
            onPressed: () { print('pressed search button'); },
            child: Icon(
              Icons.search,
              size: 24.0,
            ),
          ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height*3);
}




//search bar code:
//
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//               ),
//             ),
//           ),
//           SizedBox(width: 8.0),
//           OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               primary: buttonColor, // Text color
//               side: BorderSide(color: buttonColor), // Border color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//             ),
//             onPressed: () => _performSearch(context),
//             child: Icon(
//               Icons.search,
//               size: 24.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
