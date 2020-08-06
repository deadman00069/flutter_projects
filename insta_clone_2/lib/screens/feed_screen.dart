import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/model/people_builder.dart';
import 'package:insta_clone/screens/send_message_screen.dart';
import 'package:insta_clone/widgets/post_card.dart';
import 'package:insta_clone/widgets/circle_feed.dart';
import 'package:insta_clone/model/constants.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Billabong',
            fontSize: 24.0,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.live_tv),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: CupertinoColors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SendMessageScreen();
              }));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: peopleImages.length,
                    itemBuilder: (context, index) {
                      return CircleFeed(url: peopleImages[index]);
                    },
                  ),
                ),
                PostCard(url: 'assets/images/1.jpg'),
                PostCard(url: 'assets/images/2.jpg'),
                PostCard(url: 'assets/images/3.jpg'),
                PostCard(url: 'assets/images/4.jpg'),
                PostCard(url: 'assets/images/5.jpg'),
                PostCard(url: 'assets/images/3.jpg'),
                PostCard(url: 'assets/images/2.jpg'),
                PostCard(url: 'assets/images/3.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
