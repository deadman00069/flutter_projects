import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:heavy_bucket/screens/bottom_navigation_screens/e_commerce_screen.dart';
import 'package:heavy_bucket/screens/cart_screen.dart';
import 'package:heavy_bucket/screens/drawer/wishlist_screen.dart';
import 'package:heavy_bucket/widgets/custom_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_screens/advertise_screen.dart';
import 'bottom_navigation_screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const id = 'BottomNavigation';
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  List<Widget> _displayScreen = <Widget>[
    HomePage(),
    AdvertiseScreen(),
  ];

  List<String> pagesName = ['Home','Categories'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pagesName[_selectedIndex],
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: _selectedIndex == 0
            ? [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.id);
                  },
                ),
                IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () =>
                        Navigator.pushNamed(context, WishListScreen.id))
              ]
            : null,
      ),
      body: _displayScreen[_selectedIndex],
      drawer: CustomDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepOrangeAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(MdiIcons.bullhorn, size: 30),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
