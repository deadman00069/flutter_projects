import 'package:flutter/material.dart';
import 'package:heavy_bucket/screens/bottom_navigation_screens/advertise_screen.dart';
import 'package:heavy_bucket/screens/bottom_navigation_screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  List<Widget> _displayScreen = <Widget>[
    HomePage(),
    // CartScreen(),
    AdvertiseScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _displayScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          _onItemTapped(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Radio'),
            icon: Icon(Icons.radio),
          ),
          BottomNavigationBarItem(
            title: Text('Ac unit'),
            icon: Icon(Icons.ac_unit),
          ),
        ],
      ),
    );
  }
}
