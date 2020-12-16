import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavy_bucket/screens/drawer/add_address_screen.dart';

class ShippingAddressScreen extends StatelessWidget {
  static const id = 'ShippingAddressScreen';
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Shipping Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users/${user.uid}/address')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text('Loading please wait'));
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data.docs.length == 0) {
                        return Center(child: Text('Add Address'));
                      }
                    }
                    return ListView(
                      children: snapshot.data.docs.map((e) {
                        return Container(
                          padding: EdgeInsets.only(
                            top: 16,
                            // left: 16,
                            // right: MediaQuery.of(context).size.width * .20
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  '${e.id}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold', fontSize: 18),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '${e.data()['house']} ${e.data()['area']} ${e.data()['landmark']} ${e.data()['city']} ${e.data()['pinCode']}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 14),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => AlertDialog(
                                        title: Text('Are you sure?'),
                                        actions: [
                                          FlatButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      'users/${user.uid}/address')
                                                  .doc('${e.id}')
                                                  .delete()
                                                  .then((value) {
                                                    Fluttertoast.showToast(msg: 'Delete Successful');
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text('Yes'),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
            RaisedButton(
                child: Text('New'),
                onPressed: () {
                  Navigator.pushNamed(context, AddAddressScreen.id);
                  // var data = FirebaseFirestore.instance
                  //     .collection('users/P2hpOJmickdLUY3FVKmwrF8mRbv2/address')
                  //     .snapshots();
                  // print(data);
                }),
          ],
        ),
      ),
    );
  }
}
