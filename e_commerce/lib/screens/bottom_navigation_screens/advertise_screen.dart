import 'package:flutter/material.dart';

class AdvertiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .7, crossAxisCount: 2),
        itemBuilder: (context,index){
          return Container(
            child: Image.network('https://images.unsplash.com/photo-1583344709843-f813eb7e1565?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
          );
        },
      ),
    );
  }
}
