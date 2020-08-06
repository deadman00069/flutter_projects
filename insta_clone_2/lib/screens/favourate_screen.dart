import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_image_gallery/flutter_image_gallery.dart';
import 'package:insta_clone/model/constants.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Activity',
          style: TextStyle(
            color: CupertinoColors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Today',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/5.jpg'),
                      radius: 32,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(),
                        child: RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'alex,jack,and 6 other people',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' started following you.45m'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'This Week',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 50,
        color: kPrimaryColor,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/5.jpg'),
              radius: 20,
            ),
            SizedBox(
              width: 16,
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'alex,jack,and 6 other people',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' started following you.45m'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              width: 70,
              child: Image.asset(
                'assets/images/5.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
