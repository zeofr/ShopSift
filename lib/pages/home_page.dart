// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopsift/components/custom_bottom_navbar.dart';
import 'package:shopsift/components/my_button.dart';
import 'package:shopsift/themes/theme_provider.dart';
import 'package:provider/provider.dart';

//import 'package:shopsift/components/custom_bottom_navbar.dart';
// import 'dart:ui';
import '../components/custom_appbar.dart';
import '../components/my_box.dart';
import '/components/custom_drawer.dart';
// ignore: unused_import

//import 'components/custom_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    //double appBarHeight = MediaQuery.of(context).size.height * 0.2; // 20% of screen height
    // ignore: duplicate_ignore
    // ignore: prefer_const_constructors
    return Scaffold
    (
      // debugShowCheckedModeBanner: false,
      // home: Scaffold
      // (
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppBar(),//onThemeSwitch:(){ Provider.of<ThemeProvider>(context,listen: false).toggleTheme();}),
        endDrawer: CustomDrawer(),
        bottomNavigationBar: CustomBottomNavBar(centerText: 'Catalogue'),

        body:Padding(
          padding: EdgeInsets.all(10) ,
          child: Center(child:MyBox(
          color:Theme.of(context).colorScheme.primary,
          child: MyButton
          (
            message: 'Click',
            color: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            }
          
          )
        ))
            ),
        //)
    );
  }
}