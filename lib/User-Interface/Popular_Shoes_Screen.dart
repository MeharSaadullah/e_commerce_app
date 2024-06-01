import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:flutter/material.dart';

class PopularShoesScreen extends StatefulWidget {
  const PopularShoesScreen({super.key});

  @override
  State<PopularShoesScreen> createState() => _PopularShoesScreenState();
}

class _PopularShoesScreenState extends State<PopularShoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 255, 255, 255),
        title: Center(child: Text('Sneaker Shop')),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Row(
                children: [
                  ShoeSellingContainer(
                    seller: 'Best Seller',
                    title: 'Nike Jorden',
                    price: '\$302.00',
                    image: 'assets/homescreen_shoes1.png',
                    selecteditems: [],
                  ),
                  SizedBox(
                    width: 20,
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
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Modern A',
                      price: '\$355.0',
                      image: 'assets/pops3.png',
                      selecteditems: []),
                  SizedBox(
                    width: 20,
                  ),
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Modern B',
                      price: '\$355.0',
                      image: 'assets/pops4.png',
                      selecteditems: []),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Modern C',
                      price: '\$355.0',
                      image: 'assets/pops5.png',
                      selecteditems: []),
                  SizedBox(
                    width: 20,
                  ),
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Air 1',
                      price: '\$355.0',
                      image: 'assets/pops6.png',
                      selecteditems: []),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Air 2',
                      price: '\$355.0',
                      image: 'assets/homescreen_shoes2.png',
                      selecteditems: []),
                  SizedBox(
                    width: 20,
                  ),
                  ShoeSellingContainer(
                      seller: 'Best Seller',
                      title: 'Nike Special',
                      price: '\$355.0',
                      image: 'assets/pops8.png',
                      selecteditems: []),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
