import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/item_list.dart';

class SecondScreen extends StatefulWidget {
  final String imgUrl;
  final String itemName;
  final String itemPrice;

  SecondScreen(
      {@required this.imgUrl,
      @required this.itemName,
      @required this.itemPrice});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int quantity = 1;
  int price;
  String selectedCard='WEIGHT';

  @override
  void initState() {
    calcPrice();
  }

  void calcPrice() {
    price = int.parse(widget.itemPrice);
    print(price);
    setState(() {
      price = quantity * price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff789CEA),
      appBar: AppBar(
        backgroundColor: Color(0xff789CEA),
        elevation: 0,
        title: Text('Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 200, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.itemName,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$' '${widget.itemPrice}',
                          style: TextStyle(fontSize: 24, color: Colors.black38),
                        ),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 24, color: Colors.black38),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xff789CEA),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity == 1 ? quantity : quantity--;
                                    calcPrice();
                                  });
                                },
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                      calcPrice();
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xff789CEA),
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: nutrients.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomTile(nutrients[index],
                            nutrientValue[index], nutrientValueEx[index],selectedCard);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Text(
                        '\$' '$price' '.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 5,
            child: Hero(
              tag: widget.imgUrl,
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.imgUrl),
                radius: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String nutrients;
  final String nutrientValue;
  final String nutrientValueEx;
  final String selectedCard;

  CustomTile(this.nutrients, this.nutrientValue, this.nutrientValueEx,this.selectedCard);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(nutrients);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 15),
          width: 100,
          height: 130,
          decoration: BoxDecoration(
              color: Color(0xff789CEA),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '$nutrients',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '$nutrientValue',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$nutrientValueEx',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
