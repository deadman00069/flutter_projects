import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
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
                leading: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onPressed: () {},
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.dehaze,
                      color: Colors.white,
                      size: 32,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/yellow.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'New York',
                              style: TextStyle(
                                fontSize: 64,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Wednesday, 15 July 2020 ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '32°',
                              style: TextStyle(
                                fontSize: 128,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '🌩',
                                  style: TextStyle(fontSize: 64),
                                ),
                                Text('Raining',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,

                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
