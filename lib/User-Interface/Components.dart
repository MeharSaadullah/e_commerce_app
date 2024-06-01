import 'package:e_commerce_app/User-Interface/All_Shoes_Scree.dart';
import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/providers/favourite_screen_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// RoundButton for moving to next screen
class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const RoundButton({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

// For Google Sign in
class GoogleSigninContainer extends StatelessWidget {
  final String title;
  const GoogleSigninContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return GestureDetector(
      onTap: () {
        signInWithGoogle(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen())); // Call the sign-in function on tap
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .080),
              child: Image(
                image: AssetImage('assets/google logo.png'),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1),
                child: Text(
                  title.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> signInWithGoogle(BuildContext context) async {
  //GeneralUtils().progressindic(true);
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }).onError((error, stackTrace) {
    //GeneralUtils().showerrormessage(error.toString(), context);
    //GeneralUtils().progressindic(false);
  });
}

// For Different types of Shoes   i.e allshoes , outdoor, Tennis
class ShoesTypes extends StatelessWidget {
  final Color;
  final String title;
  const ShoesTypes({super.key, required this.Color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 95,
      child: Center(child: Text(title.toString())),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color,
      ),
    );
  }
}

// ShoeSELLING Container from which we can add fav items also on home screen
class ShoeSellingContainer extends StatefulWidget {
  final String seller;
  final String title;
  final String price;
  final String image;
  final List<String> selecteditems; // for like

  const ShoeSellingContainer({
    Key? key,
    required this.seller,
    required this.title,
    required this.price,
    required this.image,
    required this.selecteditems, // for like
  }) : super(key: key);

  @override
  _ShoeSellingContainerState createState() => _ShoeSellingContainerState();
}

class _ShoeSellingContainerState extends State<ShoeSellingContainer> {
//  final favouriteProvider = Provider.of<FavouriteItem>(context);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // consumer is used not buld the complete code again again
              Consumer<FavouriteItemProvider>(builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .32,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (value.selectedItems.contains(widget.title)) {
                        value.removeIteam(widget.title);
                      } else {
                        value.addIteam(widget.title);
                      }
                    },
                    child: Icon(
                      value.selectedItems.contains(widget.title)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: widget.selecteditems.contains(widget.title)
                          ? Colors.red // Color when item is selected
                          : Colors.black,
                    ),
                  ),
                );
              }),
              Image(image: AssetImage(widget.image)),
            ],
          ),
          Positioned(
            left: 5, // Adjust left position as needed
            bottom: 0, // Adjust bottom position as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.seller.toString(),
                  style: TextStyle(color: Colors.lightBlue),
                ),
                Text(
                  widget.title.toString(),
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    Text(
                      widget.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .2),
                      child: Container(
                        height: 30,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(13),
                          ),
                        ),
                        child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllShoesScreen()));
                                },
                                child: Icon(Icons.add))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllJogers extends StatelessWidget {
  final String image;
  const AllJogers({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Image(image: AssetImage(image.toString())),
    );
  }
}

class NotificationCard extends StatefulWidget {
  final String image;
  final String time;
  final String price;
  final String text;
  const NotificationCard(
      {super.key,
      required this.image,
      required this.time,
      required this.price,
      required this.text});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 370,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Image(image: AssetImage(widget.image)),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                widget.text,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.price,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          SizedBox(
            width: 3,
          ),
          Text(widget.time),
        ],
      ),
    );
  }
}
