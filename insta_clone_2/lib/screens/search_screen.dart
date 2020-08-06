import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/model/constants.dart';
import 'package:fbutton/fbutton.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 70,
                color: kPrimaryColor,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.search),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Icon(Icons.filter_center_focus)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: kPrimaryColor,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SearchScreenButton(
                              icon: Icons.live_tv,
                              buttonTitle: 'IGTV',
                            ),
                            SearchScreenButton(
                              icon: Icons.shopping_cart,
                              buttonTitle: 'Shopping',
                            ),
                            SearchScreenButton(
                              icon: Icons.favorite_border,
                              buttonTitle: 'Well-being',
                            ),
                            SearchScreenButton(
                              icon: Icons.card_travel,
                              buttonTitle: 'travel',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              color: Colors.red,
              child: Image.asset(
                'assets/images/5.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: kPrimaryColor,
              height: 400,
              child: IgnorePointer(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  children: <Widget>[
                    Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                    GridView.count(
                      crossAxisCount: 1,
                      children: <Widget>[
                        Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class SearchScreenButton extends StatelessWidget {
  final IconData icon;
  final String buttonTitle;

  SearchScreenButton({this.icon, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        image: Icon(
          icon,
          size: 16,
        ),
        text: buttonTitle,
        clickEffect: true,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        alignment: Alignment.center,
        corner: FCorner.all(8),
        color: Colors.white,
        strokeWidth: 0.5,
        strokeColor: Colors.grey,
        onPressed: () {},
      ),
    );
  }
}
