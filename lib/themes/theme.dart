import 'package:flutter/material.dart';


ThemeData lightMode = 
  ThemeData(
    brightness: Brightness.light,
    // colorScheme: ColorScheme.light(
    //   surface:Colors.grey.shade400,
    //   primary:Colors.grey.shade300,
    //   secondary:Colors.grey.shade200,
    //   inversePrimary: Colors.grey.shade700,
      colorScheme: ColorScheme.light(
      surface:Color.fromRGBO( 116, 139, 145,1.0),
      primary:Color.fromRGBO( 193, 209, 207,1.0),
      secondary:Color.fromRGBO( 23, 31, 34,1.0),
      inversePrimary: Color.fromRGBO( 195, 209, 207,1.0),
      ),
      
    );
  


ThemeData darkMode = 
  ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.amber//Colors.grey.shade100,
    ), // Colorscheme.dark
  );
