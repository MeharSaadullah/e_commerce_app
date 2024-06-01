import 'package:e_commerce_app/User-Interface/fourth_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .33,
                  right: MediaQuery.of(context).size.width * .5),
              child: Image(image: AssetImage('assets/design2.png')),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .27,
                  left: MediaQuery.of(context).size.width * .82),
              child: Image(image: AssetImage('assets/smile2.png')),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .25,
                  right: MediaQuery.of(context).size.width * .03),
              child: Image(image: AssetImage('assets/shoe2.png')),
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
                  Center(child: Image(image: AssetImage('assets/slider2.png'))),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .15),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 392),
                  Text(
                    "Let's Start Journey",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "With Nike",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Smart,Gorgeous & Fashionable',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Collection Explore Now',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FourthScreen()));
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
        ));
  }
}
