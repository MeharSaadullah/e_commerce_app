import 'package:e_commerce_app/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    "Welcome To ",
                    style: TextStyle(
                        fontFamily: 'Raleway-Bold',
                        fontSize: 30,
                        color: Color(
                          0xffECECEC,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Nike",
                  style: TextStyle(
                      fontFamily: 'Raleway-Bold',
                      fontSize: 30,
                      color: Color(
                        0xffECECEC,
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .28,
                left: MediaQuery.of(context).size.width * .35),
            child: Image(image: AssetImage('assets/Vector.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .22,
                left: MediaQuery.of(context).size.width * .10),
            child: Image(
                image: AssetImage(
              'assets/Design.png',
            )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .80,
              left: MediaQuery.of(context).size.width * .40,
            ),
            child: Image(image: AssetImage('assets/Slider1.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .63,
            ),
            child: Image(image: AssetImage('assets/TickMark.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .20,
            ),
            child: Image(image: AssetImage('assets/shoe.png')),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .90,
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()));
                },
                child: Container(
                  child: Center(child: Text('Get Started')),
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
