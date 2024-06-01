import 'package:e_commerce_app/User-Interface/Profile_screen_take_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  final dbRef = FirebaseDatabase.instance.ref().child('Posts');
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .3),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => ProfileScreen())));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Icon(Icons.edit)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(80),
              ),
              child: FutureBuilder<DataSnapshot>(
                future: dbRef
                    .child('Post List')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: FadeInImage.assetNetwork(
                        placeholder:
                            'loading', // Replace with your loading image asset path
                        image: snapshot.data!.child('pImage').value.toString(),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Handle the case when data is still loading
                    return CircularProgressIndicator(color: Colors.lightBlue);
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mehar Saadullah',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Change Profile Picture',
              style: TextStyle(color: Colors.lightBlue),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder<DataSnapshot>(
                future: dbRef
                    .child('Post List')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .5),
                        child: Text(
                          snapshot.data!
                              .child(
                                'pName',
                              )
                              .value
                              .toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Handle the case when data is null (e.g., return a loading indicator).
                    return Center(
                        child:
                            CircularProgressIndicator(color: Colors.lightBlue));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                'E-mail Adress',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder<DataSnapshot>(
                future: dbRef
                    .child('Post List')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .4),
                        child: Text(
                          snapshot.data!
                              .child(
                                'pEmail',
                              )
                              .value
                              .toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Handle the case when data is null (e.g., return a loading indicator).
                    return Center(
                        child:
                            CircularProgressIndicator(color: Colors.lightBlue));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                'Location',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder<DataSnapshot>(
                future: dbRef
                    .child('Post List')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .6),
                        child: Text(
                          snapshot.data!
                              .child(
                                'pCountry',
                              )
                              .value
                              .toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Handle the case when data is null (e.g., return a loading indicator).
                    return Center(
                        child:
                            CircularProgressIndicator(color: Colors.lightBlue));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                'Phone Number',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder<DataSnapshot>(
                future: dbRef
                    .child('Post List')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .5),
                        child: Text(
                          snapshot.data!
                              .child(
                                'pPhone',
                              )
                              .value
                              .toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Handle the case when data is null (e.g., return a loading indicator).
                    return Center(
                        child:
                            CircularProgressIndicator(color: Colors.lightBlue));
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
