import 'package:e_commerce_app/User-Interface/All_Shoes_Scree.dart';
import 'package:flutter/material.dart';

import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartView extends StatefulWidget {
  //final Shoe selectedShoe;
  const CartView({
    super.key, //required this.selectedShoe
  });

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Center(child: Text('My Cart')),
      ),
      body: Column(
        children: [
          Expanded(
            child: PersistentShoppingCart().showCartItems(
                cartTileWidget: ({required data}) => Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.2,
                        children: [
                          Expanded(
                              child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.lightBlue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    PersistentShoppingCart()
                                        .incrementCartItemQuantity(
                                            data.productId);

                                    // cart.incrementCartItemQuantity(
                                    //     data.productId);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data.quantity.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    PersistentShoppingCart()
                                        .decrementCartItemQuantity(
                                            data.productId);
                                    // cart.decrementCartItemQuantity(
                                    //     data.productId);
                                  },
                                  child: const Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.3,
                          children: [
                            SlidableAction(
                              flex: 1,
                              onPressed: (context) {
                                PersistentShoppingCart()
                                    .removeFromCart(data.productId);
                                // cart.removeFromCart(data.productId);
                              },
                              backgroundColor: const Color(0xffFF1900),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            )
                          ]),
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset(
                              data.productImages![0],
                              // data.currselectedShoe.image.toString(),
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),

                            SizedBox(width: 10), // Spacer
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name
                                  Text(
                                    data.productName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  // Description
                                  Text(
                                    data.productDescription.toString(),
                                    maxLines:
                                        2, // Limit to 2 lines for description
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  // Price
                                  Text(
                                    '\$${data.unitPrice.toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                showEmptyCartMsgWidget:
                    Center(child: Text('No Product In Cart'))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Subtotal'),
                SizedBox(
                  width: 100,
                ),
                PersistentShoppingCart().showTotalAmountWidget(
                    cartTotalAmountWidgetBuilder: (totalAmount) {
                  return Text('\$${totalAmount.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold));
                })
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Delivery'),
                SizedBox(
                  width: 100,
                ),
                Text(
                  '\$0.0',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Subtotal'),
                SizedBox(
                  width: 100,
                ),
                PersistentShoppingCart().showTotalAmountWidget(
                    cartTotalAmountWidgetBuilder: (totalAmount) {
                  return Text('\$${totalAmount.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold));
                })
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 45,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('CheckOUT')),
          )
        ],
      ),
    );
  }
}
