import 'dart:async';

import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/Navigation_bar.dart';
import 'package:e_commerce_app/User-Interface/PageView.dart';
import 'package:e_commerce_app/User-Interface/login_screen.dart';
import 'package:e_commerce_app/User-Interface/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    // this code is to check weather user is already log in or not
    // TODO: implement initState

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 6),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())));
    } else {
      Timer(
        Duration(seconds: 4),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageViewScreen()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              'assets/Nike.jpg',
              // fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
