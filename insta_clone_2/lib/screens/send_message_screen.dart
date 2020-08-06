import 'package:flutter/material.dart';
import 'package:insta_clone/model/constants.dart';
import 'package:fbutton/fbutton.dart';

class SendMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {

          },
        ),
        title: Text(
          'Konark',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.library_books,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: FButton(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                image: Icon(
                  Icons.search,
//              size: 16,
                ),
                text: 'Search',
                clickEffect: true,
//            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                alignment: Alignment.centerLeft,
                corner: FCorner.all(8),
                color: Colors.white,
                strokeWidth: 0.5,
                strokeColor: Colors.grey,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Messages',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            MessageTile(
              url: 'assets/images/5.jpg',
              name: 'alex',
              message: 'hi',
            ),MessageTile(
              url: 'assets/images/1.jpg',
              name: 'Jack',
              message: 'hmm',
            ),MessageTile(
              url: 'assets/images/3.jpg',
              name: 'Riley',
              message: 'Active 1h ago',
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    @required this.url,
    @required this.name,
    @required this.message,
  });

  final String url;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Material(
                elevation: 4,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(url),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.photo_camera),
        ],
      ),
    );
  }
}
