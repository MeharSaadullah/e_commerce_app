import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/login_screen.dart';

import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .20,
                left: MediaQuery.of(context).size.width * .1),
            child: Image(image: AssetImage('assets/smile3.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .15,
                right: MediaQuery.of(context).size.width * .03),
            child: Image(image: AssetImage('assets/shoe3.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .63,
            ),
            child: Image(image: AssetImage('assets/TickMark.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .77,
            ),
            child:
                Center(child: Image(image: AssetImage('assets/slider3.png'))),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .15),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 392),
                Text(
                  "You Have The",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "Power To",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'There Are Many Beautiful & Attractive',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Plants To Your Room',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .90,
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                child: Container(
                  child: Center(child: Text('Next')),
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
