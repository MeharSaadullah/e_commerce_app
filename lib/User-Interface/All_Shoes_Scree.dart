import 'package:e_commerce_app/User-Interface/CartView.dart';
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:e_commerce_app/providers/favourite_screen_providers.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() {
  runApp(AllShoesScreen());
}

class Shoes {
  final String name;
  final double price;
  final String description;
  final String image;
  final List<String> selecteditems;

  Shoes({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.selecteditems,
  });
}

class AllShoesScreen extends StatefulWidget {
  @override
  _AllShoesScreenState createState() => _AllShoesScreenState();
}

class _AllShoesScreenState extends State<AllShoesScreen> {
  late Shoes currselectedShoe; // for selection of shoes

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

  @override
  void initState() {
    super.initState();
    currselectedShoe = shoes.first; // Select the first shoe by default
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //  backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: Center(child: Text('Sneaker Shop')),
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
        body: SingleChildScrollView(
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currselectedShoe.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text("Men's Shoes"),
                    SizedBox(height: 18),
                    Text(
                      'Price: \$${currselectedShoe.price.toString()}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Image.asset(
                currselectedShoe.image,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                //width: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: shoes.map((shoe) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currselectedShoe = shoe;
                          });
                        },
                        child: AllJogers(image: shoe.image),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'show less',
                      lessStyle: TextStyle(color: Colors.blue),
                      moreStyle: TextStyle(color: Colors.blue),
                      ' ${currselectedShoe.description}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),

                  Consumer<FavouriteItemProvider>(
                      builder: (context, value, child) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .1,
                      ),
                      child: InkWell(
                        onTap: () {
                          if (value.selectedItems
                              .contains(currselectedShoe.name)) {
                            value.removeIteam(currselectedShoe.name);
                          } else {
                            value.addIteam(currselectedShoe.name);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue,
                          ),
                          child: Icon(
                            value.selectedItems.contains(currselectedShoe.name)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: currselectedShoe.selecteditems
                                    .contains(currselectedShoe.name)
                                ? Colors.red // Color when item is selected
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                  //  Image(image: AssetImage(widget.image)),

                  PersistentShoppingCart().showAndUpdateCartItemWidget(
                      inCartWidget: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.delete),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Utils.flushBarErrorMessage(
                                        'Product Remove from Cart', context);
                                  },
                                  child: Text('Remove from Cart')),
                            ],
                          )),
                      notInCartWidget: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // color: Colors.lightBlue,
                        height: 45,
                        width: 200,

                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Utils.flushBarErrorMessage(
                                      'Product added to Cart', context);
                                },
                                child: Text('Add to Cart')),
                          ],
                        ),
                      ),
                      product: PersistentShoppingCartItem(
                        productImages: [currselectedShoe.image],
                        productId: currselectedShoe.name,
                        productName: currselectedShoe.name,
                        unitPrice: currselectedShoe.price,
                        productDescription: currselectedShoe.description,
                        quantity: 1,
                      )),
                ],
              ),
              //

              //
            ],
          ),
        ),
      ),
    );
  }
}
