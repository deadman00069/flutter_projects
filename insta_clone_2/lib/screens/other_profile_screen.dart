import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/model/constants.dart';
import 'package:fbutton/fbutton.dart';

class OtherProfilePage extends StatelessWidget {
  final String url;

  OtherProfilePage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: CupertinoColors.black,
          ),
        ),
        title: Text(
          'Alice',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
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
                    Hero(
                      tag: url,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(url),
                      ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SettingButton(
                icon: Icon(Icons.keyboard_arrow_down),
                text: 'Following',
              ),
              SettingButton(
                icon: null,
                text: 'Message',
              ),
              SettingButton(
                icon: null,
                text: 'Email',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.white,
                      child: Icon(Icons.keyboard_arrow_down)),
                ),
              )
            ],
          ),
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HighLights(
                    url: 'assets/images/2.jpg',
                    text: 'Highlights',
                  ),
                  HighLights(
                    url: 'assets/images/3.jpg',
                    text: 'Singing',
                  ),
                  HighLights(
                    url: 'assets/images/4.jpg',
                    text: 'Food',
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

class SettingButton extends StatelessWidget {
  final String text;
  final Widget icon;

  SettingButton({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: FButton(
        padding: EdgeInsets.symmetric(horizontal: 14),
        text: text,
        image: icon,
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
    );
  }
}

class HighLights extends StatelessWidget {
  final String url;
  final String text;

  HighLights({this.url, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(url),
          ),
          SizedBox(height: 4),
          Text(text)
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
