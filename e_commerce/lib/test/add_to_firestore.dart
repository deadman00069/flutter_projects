import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lol extends StatelessWidget {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  void addToDb() {
    // DocumentReference ref =
    //     fireStore.collection('product').doc('categories').collection('Ground_Engaging_Tools').doc();
    // ref.set({
    //   'product_description': "description",
    //   'product_id': '${ref.id}',
    //   'product_image_url':
    //       "https://images.unsplash.com/photo-1558981420-bf351ce8e3ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    //   'product_img_url2':
    //       "https://firebasestorage.googleapis.com/v0/b/heavybucket-bb4b3.appspot.com/o/product_images%2F1.webp?alt=media&token=a6046633-1afd-4659-9a62-4a040f844fb6",
    //   'product_name': "computer",
    //   'product_price': '4500'
    // });
    fireStore.collection('users').doc('uid').collection('user_details').add({
      'firstName': 'Konark',
      'lastName': 'Shivam',
      'email': 'konark@gmail.com',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: addToDb,
        ),
      ),
    );
  }
}
