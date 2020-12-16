import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/model/add_customer_detail.dart';
import 'package:heavy_bucket/screens/fetching_user_details.dart';
import 'package:heavy_bucket/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  static const id = 'EditProfileScreen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseFirestore ref = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  String fName;

  String lName;

  String email;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref
        .collection('users/${user.uid}/user_details')
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((docs) {
        setState(() {
          myController1.text = docs.data()['fName'];
          myController2.text = docs.data()['lName'];
          myController3.text = docs.data()['eMail'];
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * .90,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/info_backimg.png', fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomTextField(
                            controller: myController1,
                            initial: fName,
                            hintText: 'First Name',
                            onValidate: (value) {
                              if (value.isEmpty) {
                                return 'Enter first name';
                              }
                              return null;
                            },
                            onSave: (value) => fName = value),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ListTile(
                        title: CustomTextField(
                          controller: myController2,
                          hintText: 'Last Name',
                          onSave: (value) => lName = value,
                          onValidate: (value) {
                            if (value.isEmpty) {
                              return 'Enter last name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ListTile(
                        title: CustomTextField(
                          controller: myController3,
                          hintText: 'Email Name',
                          onSave: (value) => email = value,
                          onValidate: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            return (!regex.hasMatch(value))
                                ? 'Enter valid email'
                                : null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                color: kPrimaryColor,
                text: 'UPDATE',
                function: () {
                  if (this._formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    CustomerDetail details = CustomerDetail(
                        fName: fName, lName: lName, eMail: email);
                    ref
                        .collection('users/${user.uid}/user_details')
                        .doc('details')
                        .set(details.addData())
                        .then(
                          (value) => Fluttertoast.showToast(
                                  msg: 'Update successful',
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0)
                              .then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FetchingUserScreen(),
                              ),
                            ),
                          ),
                        );
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function onSave;
  final Function onValidate;
  final TextEditingController controller;
  final String initial;
  CustomTextField(
      {this.hintText,
      this.onSave,
      this.onValidate,
      this.controller,
      this.initial});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      // onChanged: (value){print(value);},
      // initialValue: initial,
      controller: controller,
      decoration: InputDecoration(
          border: null,
          fillColor: Colors.white,
          filled: true,
          labelText: hintText,
          hintStyle: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
          alignLabelWithHint: true),
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.bold),
      onSaved: onSave,
      validator: onValidate,
    );
  }
}
