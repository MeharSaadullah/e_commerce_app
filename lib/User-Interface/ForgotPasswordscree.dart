import 'package:e_commerce_app/User-Interface/Components.dart';
import 'package:e_commerce_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: MediaQuery.of(context).size.width * 0.1),
              child: const Text(
                'Forgot Password',
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
                'Enter Your Email to Reset',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              'Your Password',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
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
                  decoration: const InputDecoration(hintText: 'xxxxxxxxx'),
                  validator: (value) {
                    if (value!.isEmpty) return 'Enter E-mail';
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Reset Password',
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  auth
                      .sendPasswordResetEmail(
                          email: emailcontroller.text.toString())
                      .then((value) => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content: Container(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Center(
                                                child: Icon(Icons
                                                    .mark_email_read_outlined)),
                                          ),
                                          const SizedBox(
                                            height: 45,
                                          ),
                                          const Center(
                                              child: Text(
                                            'Check Your E_mail',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          const Center(
                                              child: Text(
                                                  'We Have Send Password Recovery ')),
                                          const Center(
                                              child:
                                                  Text('Code In Your E-mail')),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          })
                      .catchError((e) {
                    setState(() {
                      loading = true;
                    });
                    Utils.flushBarErrorMessage(e.toString(), context);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
