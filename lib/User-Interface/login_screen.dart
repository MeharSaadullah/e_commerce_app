//import 'dart:js_interop';

import 'dart:convert';

import 'package:e_commerce_app/User-Interface/ForgotPasswordscree.dart';
import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/Navigation_bar.dart';
import 'package:e_commerce_app/User-Interface/SignUp_screen.dart';
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ValueNotifier<bool> _obsecurepassword =
      ValueNotifier<bool>(true); // for visibility of password
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void dispose() {
    // TODO: implement dispose              // dispose function is used for when screen will change it will release e_mail and password from memory

    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      Utils.flushBarErrorMessage(value.user!.email.toString(), context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((e) {
      debugPrint(e.toString());
      Utils.flushBarErrorMessage(e.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Hello Again!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Fill Your Detail or continue with',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Social Medial',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .050,
                    right: MediaQuery.of(context).size.width * .50),
                child: Text(
                  'Email Address',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'XYZ@gmail.com'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter E-mail';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .050,
                    right: MediaQuery.of(context).size.width * .50),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: _obsecurepassword.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          //suffixIcon: Icon(Icons.visibility_off_outlined),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurepassword.value =
                                    !_obsecurepassword.value;
                              },
                              child: Icon(_obsecurepassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .50),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text('Recover Password')),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: 'Sign in',
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {});
                      login();
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              GoogleSigninContainer(title: 'Sign In With Google'),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'New User?',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
