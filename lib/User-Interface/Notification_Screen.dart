import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Center(child: Text('Notifications')),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Recent',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          NotificationCard(
              image: 'assets/A.png',
              time: '7 min ago',
              price: '\$302.00',
              text: 'We Have New \n Products with Offers'),
          SizedBox(
            height: 10,
          ),
          NotificationCard(
              image: 'assets/B.png',
              time: '26 min ago',
              price: '\$252.00',
              text: 'We Have New \n Products with Offers'),
          SizedBox(
            height: 10,
          ),
          NotificationCard(
              image: 'assets/C.png',
              time: '48 min ago',
              price: '\$450.00',
              text: 'We Have New \n Products with Offers'),
          SizedBox(
            height: 10,
          ),
          Text(
            'Yesterday',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          NotificationCard(
              image: 'assets/D.png',
              time: '24 hr ago',
              price: '\$302.00',
              text: 'We Have New \n Products with Offers'),
        ],
      ),
    );
  }
}
