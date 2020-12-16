import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/model/add_customer_detail.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/fetch_location_screen.dart';
import 'package:heavy_bucket/widgets/custom_button.dart';

class AddDetailScreen extends StatefulWidget {
  static const id = 'AddDetailScreen';
  @override
  _AddDetailScreenState createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  User currentUser;
  String _fName;

  String _lName;

  String _eMail;

  String _validateFName(String value) {
    if (value.isEmpty) return 'First Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateLName(String value) {
    if (value.isEmpty) return 'Last Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? 'Enter valid email' : null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('null');
    } else {
      currentUser = user;
      DocumentReference d =
          FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
      d.get().then((data) {
        if (data.exists) {
          Navigator.pushNamed(context, FetchLocationScreen.id);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/images/truck.png'),
                      Text(
                        'Provide Information',
                        style: kStyle1,
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomFormField(
                              hintText: 'What\'s your First Name',
                              labelText: 'First Name *',
                              validateFunction: _validateFName,
                              onSaveFunction: (value) => {_fName = value},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              hintText: 'What\'s your Last Name',
                              labelText: 'Last Name *',
                              validateFunction: _validateLName,
                              onSaveFunction: (value) => {_lName = value},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              hintText: 'What\'s your Email',
                              labelText: 'Email *',
                              validateFunction: validateEmail,
                              onSaveFunction: (value) => {_eMail = value},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Submit',
                  color: Color(0xffFFCE33),
                  function: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      CustomerDetail customerDetail = CustomerDetail(
                        fName: _fName,
                        lName: _lName,
                        eMail: _eMail,
                      );
                      try {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(currentUser.uid).collection('user_details').doc('details')
                            .set(customerDetail.addData())
                            .then((value) => Navigator.pushNamed(
                                context, FetchLocationScreen.id));
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function onSaveFunction;
  final Function validateFunction;

  CustomFormField(
      {this.hintText,
      this.labelText,
      this.onSaveFunction,
      this.validateFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        filled: true,
        icon: Icon(Icons.person),
        hintText: hintText,
        labelText: labelText,
      ),
      onSaved: onSaveFunction,
      validator: validateFunction,
    );
  }
}
