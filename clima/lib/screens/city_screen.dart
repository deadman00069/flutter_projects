import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class City extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lol();
  }
}

class Lol extends StatefulWidget {
  @override
  _LolState createState() => _LolState();
}

class _LolState extends State<Lol> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/yellow.jpg',
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Location'),
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/yellow.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onChanged: (value){
                          cityName=value;
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          letterSpacing: 2,
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.location_city,
                              color: Colors.white,
                            ),
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    FlatButton(
                      child: Text(
                        'Get Weather',
                        style: TextStyle(fontSize: 32),
                      ),
                      onPressed: () {
                        Navigator.pop(context,cityName);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
