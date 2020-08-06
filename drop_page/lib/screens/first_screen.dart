import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFDFDFD),
        leading: Icon(
          Icons.menu,
          color: Color(0xff5EA9E0),
        ),
        title: Text('All Tasks',
          style: TextStyle(
              color: Colors.black
          ),),
        elevation: 0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView(
              children: <Widget>[
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
                CustomTile(false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                child: Icon(Icons.add),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  bool state;

  CustomTile(this.state);

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
      child: Container(
        color: Color(0xffFCFCFD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 6,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('This is my yoplo',
                  style: TextStyle(
                    decoration: widget.state ? TextDecoration.lineThrough : TextDecoration.none,
                    color: widget.state ? Color(0xffC6D1DB) : Colors.black,
                  ),),
                  Checkbox(
                    value: widget.state,
                    activeColor: Color(0xff37D7B2),
                    hoverColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        widget.state = value;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
