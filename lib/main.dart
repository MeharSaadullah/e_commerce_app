import 'package:e_commerce_app/User-Interface/ForgotPasswordscree.dart';
import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/Navigation_bar.dart';
import 'package:e_commerce_app/User-Interface/Notification_Screen.dart';
import 'package:e_commerce_app/User-Interface/Popular_Shoes_Screen.dart';
import 'package:e_commerce_app/User-Interface/Profile_screen_show_data.dart';
import 'package:e_commerce_app/User-Interface/Profile_screen_take_data.dart';
import 'package:e_commerce_app/User-Interface/Splash_screen.dart';
import 'package:e_commerce_app/User-Interface/fourth_screen.dart';
import 'package:e_commerce_app/User-Interface/login_screen.dart';
import 'package:e_commerce_app/User-Interface/second_screen.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/providers/favourite_screen_providers.dart';
import 'package:e_commerce_app/third_screen.dart';
//import 'package:e_commerce_app/All_Shoes_Scree.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';

void main() async {
  await PersistentShoppingCart().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        // Add more providers if needed
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: //NotificationScreen(),
              SplashScreen(),
        );
      }),
    );
  }
}
