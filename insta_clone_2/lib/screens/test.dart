import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: '',
    ),
    Tab(
      text: '',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(initialIndex: 1, vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tab demo"),
        bottom: new TabBar(
          tabs: myTabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return new Center(child: new Text(tab.text));
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _tabController.animateTo(_tabController.index - 1),
        // Switch tabs
        child: new Icon(Icons.swap_horiz),
      ),
    );
  }
}
