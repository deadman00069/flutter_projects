import 'package:flutter/material.dart';
import 'package:insta_clone/screens/other_profile_screen.dart';
import 'package:insta_clone/screens/view_comment_screen.dart';

class PostCard extends StatelessWidget {
  final String url;

  PostCard({this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return OtherProfilePage(url);
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Sam Martin',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '5 min',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.linear_scale),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Material(
                elevation: 24,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
                child: Hero(
                  tag: url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border),
                      SizedBox(
                        width: 4,
                      ),
                      Text('2,515'),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewCommentScreen(url);
                      }));
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.message),
                        SizedBox(
                          width: 4,
                        ),
                        Text('350'),
                      ],
                    ),
                  ),
                  Icon(Icons.bookmark_border),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
