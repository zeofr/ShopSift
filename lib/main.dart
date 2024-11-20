import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// Importing pages
import 'models/samaan.dart';
import 'pages/cart_page.dart';
import 'pages/shop_page.dart';

import 'pages/account_details_page.dart';
import 'pages/admin_page.dart';
import 'pages/settings_page.dart';

// Importing provider stuff
import 'providers/cart_provider.dart';
import 'providers/navigation_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/samaan_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;  // Import SamaanProvider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  // Register the SamaanAdapter to manage Samaan objects
  Hive.registerAdapter(SamaanAdapter());
  
    // Open the box where Samaan objects will be stored
  final samaanBox = await Hive.openBox<Samaan>('samaanBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => SamaanProvider(samaanBox)),
          ChangeNotifierProvider(create: (_) => CartProvider()), // Add SamaanProvider here
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogue App',
      initialRoute: '/shoppage',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/shoppage': (context) => ShopPage(),
        '/adminpage': (context) => AdminPage(),
        '/cartpage': (context)=>CartPage(),
        '/settings': (context) => SettingsPage(),
        '/account_details': (context) => AccountDetailsPage(),
        
      },
    );
  }
    @override
  void dispose() {
    Hive.close(); // This will close all Hive boxes when the app is disposed
    super.dispose();
  }
}
