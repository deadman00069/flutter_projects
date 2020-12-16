import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/screens/checkout/select_delivery_address_screen.dart';

class DeliveryOptionScreen extends StatefulWidget {
  static const id ='DeliveryOptionScreen';
  @override
  _DeliveryOptionScreenState createState() => _DeliveryOptionScreenState();
}

class _DeliveryOptionScreenState extends State<DeliveryOptionScreen> {
  String selectedDelivery='Standard Delivery';
  Widget trailing1 = CircleAvatar(
    radius: 14,
    backgroundColor: Color(0xffF0F0F0),
  );
  Widget trailing2 = CircleAvatar(
    radius: 14,
    backgroundColor: Color(0xffF0F0F0),
  );

  void lol(int index,String heading) {
    selectedDelivery=heading;
    if (index == 1) {
      setState(() {
        trailing1 = CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF0F0F0),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.orange,
          ),
        );
        trailing2 = CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF0F0F0),
        );
      });
    } else {
      setState(() {
        trailing2 = CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF0F0F0),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.orange,
          ),
        );
        trailing1 = CircleAvatar(
          radius: 14,
          backgroundColor: Color(0xffF0F0F0),
        );
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lol(1, 'Standard Delivery');
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 19,
                              child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Delivery'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          height: 1.0,
                          width: media.width * .25,
                          color: Color(0xffDDDDDD),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffDDDDDD),
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Address'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          height: 1.0,
                          width: media.width * .25,
                          color: Color(0xffDDDDDD),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffDDDDDD),
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Payment'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Select Delivery',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              CustomCheckoutCard(
                heading: 'Standard Delivery',
                title: 'Order will be delivered between 3 - 5 business days',
                onTap: lol,
                index: 1,
                trailing: trailing1,
              ),
              CustomCheckoutCard(
                heading: 'Next Day Delivery',
                title:
                    'Place your order before 6pm and your items will be delivered the next day',
                onTap: lol,
                index: 2,
                trailing: trailing2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: media.width * .4,
                  ),
                  Container(
                    width: media.width * .4,
                    child: RaisedButton(
                        child: Text('NEXT'),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, SelectDeliveryAddressScreen.id);
                          print(selectedDelivery);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckoutCard extends StatelessWidget {
  final String heading;
  final String title;
  final Function onTap;
  final int index;
  final Widget trailing;
  CustomCheckoutCard(
      {this.title, this.heading, this.onTap, this.index, this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index,heading);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                  title: Text(
                    title,
                    style: TextStyle(color: Colors.black54),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  trailing: trailing),
            ],
          ),
        ),
      ),
    );
  }
}
