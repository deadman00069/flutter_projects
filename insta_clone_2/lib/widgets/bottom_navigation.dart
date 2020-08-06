import 'package:flutter/material.dart';
import 'package:insta_clone/model/constants.dart';
import 'package:insta_clone/screens/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.dashboard),
          ),
          IconButton(
            icon: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: Material(
                color: kButtonColor,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
