import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 140,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CustomTile(),
                      CustomTile(),
                      CustomTile(),
                      CustomTile(),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xffFDFDFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 6,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Thursday,10th',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff6165FA),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffA8A9BD),
                            ),
                          )
                        ],
                      ),
                      Text(
                        'December',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffA8A9BD),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 270,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                  backgroundColor: Color(0xffFA6566),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xffF4F7FA),
          ),
        ),
      ),
      child: CheckboxListTile(
        value: state,
        activeColor: Color(0xffFA6566),
        title: Text(
          'Morning Run',
          style: TextStyle(
              fontSize: 16,
              color: state ? Color(0xffD6D6E4) : Colors.black54,
              decoration:
              state ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        secondary: Text(
          '7pm',
        ),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) {
          setState(() {
            print(value);
            state = value;
          });
        },
      ),
    );
  }
}
