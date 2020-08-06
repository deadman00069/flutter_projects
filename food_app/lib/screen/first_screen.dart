import 'package:flutter/material.dart';
import 'package:food_app/model/item_list.dart';
import 'package:food_app/screen/second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21BFBD),
      appBar: AppBar(
        backgroundColor: Color(0xff21BFBD),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.scanner),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(
                  'Healthy',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Food',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return CustomTile(
                    imgUrl: images[index],
                    itemName: names[index],
                    itemPrice: price[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String imgUrl;
  final String itemName;
  final String itemPrice;

  CustomTile(
      {@required this.imgUrl,
      @required this.itemName,
      @required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondScreen(imgUrl: imgUrl,itemName: itemName,itemPrice: itemPrice,);
                  }));
                },
                child: Hero(
                  tag: imgUrl,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imgUrl),
                    radius: 32,
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$' '$itemPrice''.00',
                    style: TextStyle(fontSize: 14, color: Colors.black38),
                  )
                ],
              ),
            ],
          ),

          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
