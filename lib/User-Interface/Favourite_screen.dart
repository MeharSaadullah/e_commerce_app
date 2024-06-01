// import 'package:e_commerce_app/User-Interface/Components.dart'; // Corrected import statement
// import 'package:e_commerce_app/providers/favourite_screen_providers.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavouriteScreen extends StatefulWidget {
//   const FavouriteScreen({Key? key}) : super(key: key);

//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }

// class _FavouriteScreenState extends State<FavouriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
//     List<Widget> favoriteContainers = [
//       if (favouriteProvider.selectedItems.contains('Nike Jorden'))
//         ShoeSellingContainer(
//           seller: 'Best Seller',
//           title: 'Nike Jorden',
//           price: '\$302.00',
//           image: 'assets/homescreen_shoes1.png',
//           selecteditems: favouriteProvider.selectedItems,
//         ),
//       if (favouriteProvider.selectedItems.contains('Nike Air Max'))
//         ShoeSellingContainer(
//           seller: 'Best Seller',
//           title: 'Nike Air Max',
//           price: '\$355.00',
//           image: 'assets/homescreen_shoes2.png',
//           selecteditems: favouriteProvider.selectedItems,
//         ),
//       if (favouriteProvider.selectedItems.contains('Nike Modern B'))
//         ShoeSellingContainer(
//           seller: 'Worst Seller',
//           title: 'Nike Jorden B',
//           price: '\$502.00',
//           image: 'assets/D.png',
//           selecteditems: favouriteProvider.selectedItems,
//         ),
//     ]; // Removed unnecessary semicolon

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Favourite Items')),
//         backgroundColor: Colors.lightBlue,
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(8.0),
//           children: favoriteContainers,
//         ),
//       ),
//     );
//   }
// }

//     //...........................................

//         //....................................................

//       //   // if (favouriteProvider.selectedItems.contains('Nike Air Max'))
//       //   //   ShoeSellingContainer(
//       //   //       seller: 'Best Seller',
//       //   //       title: 'Nike React Element \nm55',
//       //   //       price: '119.00',
//       //   //       image: 'assets/C.png',
//       //   //       selecteditems: []),
//       //   // if (favouriteProvider.selectedItems.contains('Nike Air Max'))
//       //   //   ShoeSellingContainer(
//       //   //       seller: 'Best Seller',
//       //   //       title: 'Nike Zoom Pegasus \na38',
//       //   //       price: '180.20',
//       //   //       image: 'assets/D.png',
//       //   //       selecteditems: []),
//       //   // if (favouriteProvider.selectedItems.contains('Nike Air Max'))
//       //   //   ShoeSellingContainer(
//       //   //       seller: 'Best Seller',
//       //   //       title: 'Nike Blazer Mid \nz90',
//       //   //       price: '250.00',z
//       //   //       image: 'assets/E.png',
//       //   //       selecteditems: []),

//       //   // Add more ShoeSellingContainer widgets for other favorite items
//       //
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/providers/favourite_screen_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    List<Widget> favoriteContainers = [];

    // Your list of shoes
    List<ShoeSellingContainer> shoes = [
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Jorden',
        price: '\$302.00',
        image: 'assets/homescreen_shoes1.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Air Max',
        price: '\$355.00',
        image: 'assets/homescreen_shoes2.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Modern A',
        price: '\$355.0',
        image: 'assets/pops3.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Modern B',
        price: '\$355.0',
        image: 'assets/pops4.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Modern C',
        price: '\$355.0',
        image: 'assets/pops5.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Air 1',
        price: '\$355.0',
        image: 'assets/pops6.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Air 2',
        price: '\$355.0',
        image: 'assets/homescreen_shoes2.png',
        selecteditems: [],
      ),
      ShoeSellingContainer(
        seller: 'Best Seller',
        title: 'Nike Special',
        price: '\$355.0',
        image: 'assets/pops8.png',
        selecteditems: [],
      ),
      // Add more ShoeSellingContainer widgets as needed
    ];

    // Generate ShoeSellingContainer widgets for selected shoes
    for (ShoeSellingContainer shoe in shoes) {
      if (favouriteProvider.selectedItems.contains(shoe.title)) {
        favoriteContainers.add(shoe);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favourite Items')),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: favoriteContainers,
        ),
      ),
    );
  }
}
