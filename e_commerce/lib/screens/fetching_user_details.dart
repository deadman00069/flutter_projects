import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/providers/profile_provider.dart';
import 'package:heavy_bucket/screens/bottom_tab_screen.dart';
import 'package:heavy_bucket/test/test_item_screen.dart';
import 'package:provider/provider.dart';

class FetchingUserScreen extends StatefulWidget {
  @override
  _FetchingUserScreenState createState() => _FetchingUserScreenState();
}

class _FetchingUserScreenState extends State<FetchingUserScreen> {
  final FirebaseFirestore ref = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var info = Provider.of<ProfileInfoProvider>(context, listen: false);
      ref
          .collection('users/${user.uid}/user_details')
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((docs) {
          print(docs.data()['fName']);
          info.firstName = docs.data()['fName'];
          info.lastName = docs.data()['lName'];
          info.email = docs.data()['eMail'];
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavigation()));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
