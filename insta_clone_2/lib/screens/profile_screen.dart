import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/model/constants.dart';
import 'package:fbutton/fbutton.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: Center(
          child: Text(
            'Alice',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/5.jpg'),
                    ),
                    Column(
                      children: <Widget>[
                        Text('4'),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('146'),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('446'),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Alicea',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: FButton(
              text: 'Edit Profile',
              clickEffect: true,
              style: TextStyle(fontWeight: FontWeight.w500),
              alignment: Alignment.center,
              height: 32,
              corner: FCorner.all(8),
              color: Colors.white,
              strokeWidth: 0.5,
              strokeColor: Colors.grey,
              onPressed: () {},
            ),
          ),
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Material(
                        type: MaterialType.transparency,
                        //Makes it usable on any background color, thanks @IanSmith
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: .7),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            //This keeps the splash effect within the circle
                            borderRadius: BorderRadius.circular(1000.0),
                            //Something large to ensure a circle
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.add,
                                size: 32,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('New')
                    ],
                  ),
                ],
              ),
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Container(
              height: 400,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  flexibleSpace: SafeArea(
                    child: TabBar(
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.grid_on,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.people,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    IgnorePointer(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: <Widget>[
                          GridProfilePhoto('assets/images/1.jpg'),
                          GridProfilePhoto('assets/images/2.jpg'),
                          GridProfilePhoto('assets/images/3.jpg'),
                          GridProfilePhoto('assets/images/4.jpg'),
                          GridProfilePhoto('assets/images/5.jpg'),
                          GridProfilePhoto('assets/images/3.jpg'),
                          GridProfilePhoto('assets/images/2.jpg'),
                          GridProfilePhoto('assets/images/1.jpg'),
                          GridProfilePhoto('assets/images/4.jpg'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 16,
                          ),
                          Text(
                            'Photo and Videos of You ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 16,
                          ),
                          Text(
                            'When people tag you in photos and videos,they\'ll appear here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridProfilePhoto extends StatelessWidget {
  final String url;

  GridProfilePhoto(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 2, top: 1, bottom: 1),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
