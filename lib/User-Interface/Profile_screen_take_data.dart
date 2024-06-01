import 'dart:io';

import 'package:e_commerce_app/User-Interface/Profile_screen_show_data.dart';
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  File? _image;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();

  final auth = FirebaseAuth.instance;
  final postRef = FirebaseDatabase.instance.ref().child('Posts');
  // FirebaseAuth.instance.curre
  // DatabaseReference databaseRef = FirebaseDatabase.instance
  //     .ref('Posts'); // Initialize the table to store images

  Future<void> getGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Code to pick an image from the gallery
    );

    // Check if the widget is still mounted before calling setState
    if (!mounted) return;

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image picked');
      }
    });
  }

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
                      width: 43,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => ProfileData())));
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.lightBlue, fontSize: 20),
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
                  borderRadius: BorderRadius.circular(80)),
              child: _image != null
                  ? Image.file(
                      _image!.absolute,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.image),
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
            InkWell(
              onTap: () {
                getGalleryImage();
                //    Navigator.pop(context);
              },
              child: Text(
                'Change Profile Picture',
                style: TextStyle(color: Colors.lightBlue),
              ),
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
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: nameController,
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
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: emailController,
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
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: locationController,
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
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: phoneController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Save',
              ontap: () async {
                try {
                  int date = DateTime.now().microsecondsSinceEpoch;
                  firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance
                      .ref('/e-commerce app$date');
                  firebase_storage.UploadTask uploadTask =
                      ref.putFile(_image!.absolute);
                  await Future.value(uploadTask);
                  var newUrl = await ref.getDownloadURL();
                  final User? user = auth.currentUser;
                  postRef
                      .child('Post List')
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                        'pId': date.toString(),
                        'pImage': newUrl.toString(),
                        'pTime': date.toString(),
                        'pName': nameController.text.toString(),
                        'pPhone': phoneController.text.toString(),
                        'pCountry': locationController.text.toString(),
                        'pEmail': user!.email.toString(),
                      })
                      .then((value) => {
                            Utils.flushBarErrorMessage(
                                'Post Uploaded', context),
                          })
                      .onError((error, stackTrace) => {
                            Utils.flushBarErrorMessage(
                                error.toString(), context),
                          });
                } catch (e) {
                  Utils.flushBarErrorMessage(e.toString(), context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
