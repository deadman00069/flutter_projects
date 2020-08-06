import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewCommentScreen extends StatelessWidget {
  final String url ;

  ViewCommentScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                height: 450,
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
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 32,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),

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
                                Text(
                                  'Sam Martin',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          Row(
                            children: <Widget>[
                              Icon(Icons.message),
                              SizedBox(
                                width: 4,
                              ),
                              Text('350'),
                            ],
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    CommentBuilder(url: url),
                    CommentBuilder(url: url),
                    CommentBuilder(url: url),
                    CommentBuilder(url: url),
                    CommentBuilder(url: url),
                    CommentBuilder(url: url),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentBuilder extends StatelessWidget {
  const CommentBuilder({
    @required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sam Martin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Looks so good .',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
