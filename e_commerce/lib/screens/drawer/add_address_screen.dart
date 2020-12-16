import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/model/add_address_detail_model.dart';
import 'package:heavy_bucket/screens/drawer/shipping_address_screen.dart';

class AddAddressScreen extends StatefulWidget {
  static const id = 'AddAddressScreen';

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final user = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();
  String id = '0';
  String house;

  String landmark;

  String area;

  String city;

  String pinCode;

  Color defaultColor = Colors.red;
  Color selectedColor = Colors.yellow;
  var selectedIndex = 0;
  var selectedButton = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Address',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height +
                    MediaQuery.of(context).size.height * .10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/address.jpg',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Address Details',
                      style: TextStyle(fontSize: 32),
                    ),
                    CustomFormField(
                      keyboard: TextInputType.text,
                      labelText: 'HOUSE/FLAT/BLOCK NO.',
                      validateFunction: (value) =>
                          value.isEmpty ? 'This field must not empty' : null,
                      onSaveFunction: (value) => house = value,
                    ),
                    CustomFormField(
                      keyboard: TextInputType.text,
                      hintText: 'Landmark for easy reach out',
                      labelText: 'LANDMARK',
                      validateFunction: (value) =>
                          value.isEmpty ? 'This field must not empty' : null,
                      onSaveFunction: (value) => landmark = value,
                    ),
                    CustomFormField(
                      keyboard: TextInputType.text,
                      hintText: 'Area details',
                      labelText: 'AREA',
                      validateFunction: (value) =>
                          value.isEmpty ? 'This field must not empty' : null,
                      onSaveFunction: (value) => area = value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomFormField(
                            keyboard: TextInputType.text,
                            labelText: 'CITY',
                            validateFunction: (value) => value.isEmpty
                                ? 'This field must not empty'
                                : null,
                            onSaveFunction: (value) => city = value,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: CustomFormField(
                            keyboard: TextInputType.number,
                            labelText: 'PINCODE',
                            validateFunction: (value) {
                              if (value.isEmpty) {
                                return 'This field must not empty';
                              }
                              if (value.length < 6 || value.length > 6) {
                                return 'Enter valid PINCODE';
                              }
                              return null;
                            },
                            onSaveFunction: (value) => pinCode = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'SAVE AS',
                            style: TextStyle(color: Colors.black45),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                child: Text('Home'),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 0;
                                    selectedButton = 'Home';
                                  });
                                },
                                color: selectedIndex == 0
                                    ? selectedColor
                                    : defaultColor,
                              ),
                              RaisedButton(
                                child: Text('Work'),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                    selectedButton = 'Work';
                                  });
                                },
                                color: selectedIndex == 1
                                    ? selectedColor
                                    : defaultColor,
                              ),
                              RaisedButton(
                                child: Text('Other'),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 2;
                                    selectedButton = 'Other';
                                  });
                                },
                                color: selectedIndex == 2
                                    ? selectedColor
                                    : defaultColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (this._formKey.currentState.validate()) {
                            this._formKey.currentState.save();
                            if (selectedButton == 'Home') {
                              id = '0';
                            }
                            if (selectedButton == 'Work') {
                              id = '1';
                            }
                            if (selectedButton == 'Other') {
                              id = '2';
                            }

                            AddAddress addressInfo = new AddAddress(
                              house: house,
                              landmark: landmark,
                              area: area,
                              city: city,
                              pinCode: pinCode,
                              id: id
                            );
                            FirebaseFirestore.instance
                                .collection('users/${user.uid}/address')
                                .doc('$selectedButton')
                                .set(addressInfo.addData())
                                .then((_) {
                              Fluttertoast.showToast(
                                  msg: 'Address Added Successful');
                              Navigator.pushNamed(
                                  context, ShippingAddressScreen.id);
                            });
                          }
                        }),
                  ],
                ),
              ),
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
  final TextInputType keyboard;

  CustomFormField(
      {this.hintText,
      this.labelText,
      this.onSaveFunction,
      this.validateFunction,
      this.keyboard});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14),
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboard,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
        filled: true,
        // icon: Icon(Icons.person),
        hintText: hintText,
        labelText: labelText,
      ),
      onSaved: onSaveFunction,
      validator: validateFunction,
    );
  }
}
