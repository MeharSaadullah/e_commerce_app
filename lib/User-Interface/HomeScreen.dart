import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/User-Interface/All_Shoes_Scree.dart';
import 'package:e_commerce_app/User-Interface/CartView.dart';
import 'package:e_commerce_app/User-Interface/Favourite_screen.dart';
//import 'package:e_commerce_app/User-Interface/MyCart_scree.dart';
import 'package:e_commerce_app/User-Interface/Notification_Screen.dart';
import 'package:e_commerce_app/User-Interface/Popular_Shoes_Screen.dart';
import 'package:e_commerce_app/User-Interface/Profile_screen_show_data.dart';
import 'package:e_commerce_app/User-Interface/Profile_screen_take_data.dart';
import 'package:e_commerce_app/User-Interface/Splash_screen.dart';
import 'package:e_commerce_app/User-Interface/login_screen.dart';
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Shoes> shoes = [
    Shoes(
      name: 'Nike Air Max 250 \nEssential  ',
      price: 179.39,
      description:
          'The Jogger Nike Air Max Essential shoes blend iconic style with modern comfort, making them a versatile choice for both athletic performance and casual wear. Crafted with precision and attention to detail, these shoes feature a sleek design with a breathable mesh upper that offers excellent ventilation, keeping your feet cool and comfortable during any activity.',
      image: 'assets/A.png',
      selecteditems: [],
    ),
    Shoes(
      name: 'Nike Jordan Pro \nq57',
      price: 155.05,
      description:
          "The Nike Jordan shoes epitomize urban style and athletic performance. With iconic designs and innovative technology, these shoes offer unparalleled comfort and support. Inspired by Michael Jordan's legendary career, they boast a sleek silhouette and premium materials. Elevate your streetwear game with Nike Jordan shoes",
      image: 'assets/B.png',
      selecteditems: [],
    ),
    Shoes(
      name: 'Nike React Element \nm55',
      price: 119.00,
      description:
          "The Nike React Element 55 combines modern style with cutting-edge technology. Featuring a lightweight design and responsive cushioning, these shoes offer maximum comfort and support for all-day wear. With a sleek silhouette and vibrant color options, they're perfect for both casual outings and intense workouts. Step up your footwear game with the Nike React Element 55",
      image: 'assets/C.png',
      selecteditems: [],
    ),
    Shoes(
      name: 'Nike Zoom Pegasus \na38',
      price: 180.20,
      description:
          "The Nike Zoom Pegasus 38 boasts responsive cushioning and a secure fit, perfect for daily runs or casual wear. Experience comfort and performance with every step",
      image: 'assets/D.png',
      selecteditems: [],
    ),

    Shoes(
      name: 'Nike Blazer Mid \nz90',
      price: 250.00,
      description:
          "The Nike Blazer Mid delivers timeless style with modern comfort. Featuring a retro design and premium materials, it's a versatile choice for any casual or streetwear ensemble",
      image: 'assets/E.png',
      selecteditems: [],
    ),
    // Add more shoes as needed
  ];

  // for changing of screen in bottom navigation bar
  int iteamindex = 0;

  final auth = FirebaseAuth.instance;

  final searchfilter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Image(image: AssetImage('assets/Drawer.png')),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        toolbarHeight: 122,
        backgroundColor: Colors.grey.shade300,
        title: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .01,
            left: MediaQuery.of(context).size.width * .1,
          ),
          child: const Text(
            'Explore',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
              cartItemCountWidgetBuilder: (iteamcount) => IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartView()));
                  },
                  icon: Badge(
                    label: Text(iteamcount.toString()),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.shopping_bag_rounded,
                      ),
                    ),
                  )))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/saad.jpeg')),
                accountName: Text('Mehar Saadullah'),
                accountEmail: Text('Mmeharsaadullah@gmail.com')),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileData()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('My Cart'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartView()));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favourite'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouriteScreen()
                      //FavouriteScreen(shoes: shoes),
                      ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 0.20,
              width: 350,
              color: Colors.blue,
            ),
            // Image(image: AssetImage('assets/line.png')),
            SizedBox(
              height: 10,
            ),
            ListTile(
                leading: GestureDetector(
                    onTap: () {
                      auth
                          .signOut()
                          .then((value) => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()))
                              })
                          .catchError((e) {
                        Utils.flushBarErrorMessage(e.toString(), context);
                      });
                    },
                    child: Icon(Icons.logout)),
                title: Text('Sign Out'))
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,

      //  BOTTOM NAVIGATION BAR
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            iteamindex = index;
          });
          switch (iteamindex) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteScreen(),
                  //FavouriteScreen(shoes: shoes)
                ),
              );
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartView()));
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileData()));
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

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(.1),
                  child: Row(
                    children: [],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width) *
                          .1,
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: SearchController(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Looking for shoes',
                            prefixIcon: Icon(Icons.search),
                            // suffixIcon: Icon(Icons.search),
                            // icon: Icon(Icons.search),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(50),
                            // ),
                            //            onChanged: (String value) {
                            //   // this code also use for search when user keyword value will changed
                            //   setState(() {});
                            // },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.tune,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .5),
                  child: Text(
                    'Select Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ShoesTypes(Color: Colors.white, title: 'All Shoes'),
                    SizedBox(
                      width: 20,
                    ),
                    ShoesTypes(Color: Colors.blue, title: 'Outdoor'),
                    SizedBox(width: 20),
                    ShoesTypes(Color: Colors.white, title: 'Tennis'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .060),
                  child: Row(
                    children: [
                      Text(
                        'Popular Shoes',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllShoesScreen()));
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .060),
                  child: Row(
                    children: [
                      ShoeSellingContainer(
                        seller: 'Best Seller',
                        title: 'Nike Jorden',
                        price: '\$302.00',
                        image: 'assets/homescreen_shoes1.png',
                        selecteditems: [],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ShoeSellingContainer(
                        seller: 'Best Seller',
                        title: 'Nike Air Max',
                        price: '\$355.00',
                        image: 'assets/homescreen_shoes2.png',
                        selecteditems: [],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .060),
                  child: Row(
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopularShoesScreen()));
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/star.png')),
                      Image(image: AssetImage('assets/Sale.png')),
                      Image(image: AssetImage('assets/star.png')),
                      Image(image: AssetImage('assets/new.png')),
                      Image(image: AssetImage('assets/homescreen_shoes3.png')),
                      Image(image: AssetImage('assets/star.png')),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
