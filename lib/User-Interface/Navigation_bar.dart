import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/User-Interface/CartView.dart';
import 'package:e_commerce_app/User-Interface/Favourite_screen.dart';
import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/Notification_Screen.dart';
import 'package:e_commerce_app/User-Interface/Profile_screen_show_data.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int iteamindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  BOTTOM NAVIGATION BAR
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            iteamindex = index;
          });
          switch (iteamindex) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()));
              break;
            // case 1:
            //   Navigator.push(context,

            //       MaterialPageRoute(builder: (context) => FavouriteScreen(shoes: shoes)));
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );

              // case 2:
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => CartView()));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileData()));
              break;
          }
        },
        backgroundColor: Colors.grey.shade300,
        items: [
          const Icon(
            Icons.home,
            //  color: Colors.blueGrey,
          ),
          const Icon(
            Icons.favorite_outline,
            // color: Colors.blueGrey,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.shopping_bag_rounded,
            ),
          ),
          const Icon(
            Icons.notifications,

            //  color: Colors.blueGrey,
          ),
          const Icon(
            Icons.account_circle,
            //color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
