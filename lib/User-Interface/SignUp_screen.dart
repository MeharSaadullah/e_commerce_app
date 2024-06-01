import 'package:e_commerce_app/User-Interface/HomeScreen.dart';
import 'package:e_commerce_app/User-Interface/login_screen.dart';
import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> _obsecurepassword =
      ValueNotifier<bool>(true); // for visibility of password

  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  void dispose() {
    // TODO: implement dispose              // dispose function is used for when screen will change it will release e_mail and password from memory

    emailcontroller.dispose();
    passwordcontroller.dispose();
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
                  'Register Account',
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
                  'Your Name',
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
                      controller: namecontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Your Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name';
                        }
                      }),
                ),
              ),
              // Center(
              //   child: ValueListenableBuilder(
              //     valueListenable: _obsecurepassword,
              //     builder: (context, value, child) {
              //       return Container(
              //         height: 50,
              //         width: 300,
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade300,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: TextFormField(
              //           controller: passwordcontroller,
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: '*******',
              //             //suffixIcon: Icon(Icons.visibility_off_outlined),
              //             suffixIcon: InkWell(
              //                 onTap: () {
              //                   _obsecurepassword.value =
              //                       !_obsecurepassword.value;
              //                 },
              //                 child: Icon(_obsecurepassword.value
              //                     ? Icons.visibility_off_outlined
              //                     : Icons.visibility)),
              //           ),
              //           validator: (value) {
              //             if (value!.isEmpty) {
              //               return 'Enter Password';
              //             }
              //           },
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
                      }),
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

              // Center(
              //   child: Container(
              //     height: 50,
              //     width: 300,
              //     decoration: BoxDecoration(
              //         color: Colors.grey.shade300,
              //         borderRadius: BorderRadius.circular(10)),
              //     child: TextFormField(
              //         controller: passwordcontroller,
              //         decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: '*******',
              //             suffixIcon: Icon(Icons.visibility_off_outlined)),
              //         validator: (value) {
              //           if (value!.isEmpty) {
              //             return 'Enter Password';
              //           }
              //         }),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: 'Sign up',
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        loading = true; //loading
                      });
                      auth
                          .createUserWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text.toString())
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }).catchError((e) {
                        Utils.flushBarErrorMessage(e.toString(), context);
                      });
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              GoogleSigninContainer(title: 'Sign Up With Google'),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account?',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Log in',
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
