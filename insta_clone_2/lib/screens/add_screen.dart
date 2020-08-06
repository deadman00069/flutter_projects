import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_image_gallery/flutter_image_gallery.dart';
import 'package:insta_clone/model/constants.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => new _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  Map<dynamic, dynamic> allImageInfo = new HashMap();
  List allImage = new List();

  @override
  void initState() {
    super.initState();
    loadImageList();
  }

  Future<void> loadImageList() async {
    Map<dynamic, dynamic> allImageTemp;
    allImageTemp = await FlutterImageGallery.getAllImages;
    print(" call $allImageTemp.length");

    setState(() {
      this.allImage = allImageTemp['URIList'] as List;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: new AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: CupertinoColors.black,
            ),
          ),
          title: Text(
            'Gallery',
            style: TextStyle(color: CupertinoColors.black),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                  )),
            )
          ],
        ),
        body: _buildGrid(),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(0.0),
      children: _buildGridTileList(allImage.length),
    );
  }

  List<Container> _buildGridTileList(int count) {
    return List<Container>.generate(
      count,
          (int index) => Container(
        child: Image.file(
          File(allImage[index].toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
