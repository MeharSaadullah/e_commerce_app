import 'package:e_commerce_app/User-Interface/fourth_screen.dart';
import 'package:e_commerce_app/User-Interface/second_screen.dart';
import 'package:e_commerce_app/third_screen.dart';

import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          SecondScreen(),
          ThirdScreen(),
          FourthScreen(),
        ],
      ),
    );
  }
}
