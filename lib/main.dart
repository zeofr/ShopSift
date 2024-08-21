// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


//importing components dart files:

//importing pages:
import 'package:shopsift/pages/home_page.dart';
import 'package:shopsift/pages/shopping_page.dart';
import 'pages/account_details_page.dart';
import 'pages/settings_page.dart';

//importing provider stuff
import 'package:shopsift/themes/theme_provider.dart';
import 'package:provider/provider.dart';

//importing firebase
// import 'package:shopsift/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  final appDocumentDirectory =await  path_provider.getApplicationDocumentsDirectory;
  await Hive.initFlutter();  
  await Hive.openBox('shopping_cart');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  // Restrict to portrait mode only
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      )
      );
  });
}


class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogue App',
      //initialRoute: '/',
      theme:Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => HomePage(),





        '/shoppage': (context) => ShoppingPage(),
        '/settings': (context) => SettingsPage(),
        '/account_details': (context) => AccountDetailsPage(),
        // '/signup': (context) => SignUpPage(),
        // '/signin': (context) => SignInPage(),
        // '/cartpage': (context) => CartPage(),
        // '/aboutus': (context) => AboutUsPage(),
        // '/intro': (context) => IntroPage(),
        
      }, 
      home:FutureBuilder(
        future: Hive.openBox('products'),
        builder: (BuildContext context,AsyncSnapshot snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            else {
              return HomePage();
            }
          }
          else{
            return Scaffold();
          }
        }
        )
    );
  }
  @override
  void dispose(){
    super.dispose();
    Hive.close();
  }
  
}
