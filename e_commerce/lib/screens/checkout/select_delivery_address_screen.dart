import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/screens/checkout/payment_screen.dart';

class SelectDeliveryAddressScreen extends StatefulWidget {
  static const id = 'SelectDeliveryAddressScreen';

  @override
  _SelectDeliveryAddressScreenState createState() =>
      _SelectDeliveryAddressScreenState();
}

class _SelectDeliveryAddressScreenState
    extends State<SelectDeliveryAddressScreen> {
  final user = FirebaseAuth.instance.currentUser;
  String finalHouse;
  String finalArea;
  String finalCity;
  String finalLandMark;
  String finalPinCode;
  // int index = 0;
  List<Icon> icons = [
    Icon(Icons.circle,color: Colors.orange,),
    Icon(Icons.circle,color: Colors.orange,),
    Icon(Icons.circle,color: Colors.orange,),
  ];
  Icon icon2 = Icon(Icons.check_circle);
  void selectedAddressCard(String nickName) {
    if (nickName == 'Home') {
      setState(() {
        icons[0] = Icon(
          Icons.check_circle,
          color: Colors.orange,
        );
        icons[1] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
        icons[2] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
      });
    }
    if (nickName == 'Work') {
      setState(() {
        icons[1] = Icon(
          Icons.check_circle,
          color: Colors.orange,
        );
        icons[0] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
        icons[2] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
      });
    }
    if (nickName == 'Other') {
      setState(() {
        icons[2] = Icon(
          Icons.check_circle,
          color: Colors.orange,
        );
        icons[0] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
        icons[1] = Icon(
          Icons.circle,
          color: Colors.orange,
        );
      });
    }
  }

  void selectedAddress(
      {String house,
      String area,
      String city,
      String landMark,
      String pinCode}) {
    print(house);
    finalHouse = house;
    finalArea = area;
    finalCity = city;
    finalLandMark = landMark;
    finalPinCode = pinCode;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
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
                          height: 2.0,
                          width: media.width * .25,
                          color: Colors.orange,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.orange,
                              ),
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
                    'Select a delivery address',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users/${user.uid}/address')
                      .orderBy('id')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text('Loading please wait'));
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data.docs.length == 0) {
                        return Center(child: Text('Add Address'));
                      }
                    }
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return CustomSelectAddressCard(
                              nickName: snapshot.data.docs[index].id,
                              house: snapshot.data.docs[index].data()['house'],
                              area: snapshot.data.docs[index].data()['area'],
                              city: snapshot.data.docs[index].data()['city'],
                              landMark:
                                  snapshot.data.docs[index].data()['landmark'],
                              pinCode:
                                  snapshot.data.docs[index].data()['pinCode'],
                              onTap: selectedAddressCard,
                              leading: icons[index],
                              getDetails: selectedAddress,
                            );
                          }),
                    );
                  }),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Proceed to payment'),
                  onPressed: () {

                  Navigator.pushNamed(context, PaymentScreen.id);
                    //
                    // if(finalHouse == null)
                    //   {
                    //     return;
                    //   }
                    // print(finalHouse);

                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSelectAddressCard extends StatelessWidget {
  final String house;
  final String area;
  final String city;
  final String landMark;
  final String pinCode;
  final String nickName;
  final Function onTap;
  final Icon leading;
  final Function getDetails;
  CustomSelectAddressCard(
      {this.house,
      this.area,
      this.city,
      this.landMark,
      this.pinCode,
      this.nickName,
      this.onTap,
      this.leading,
      this.getDetails});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap(nickName);
        getDetails(
            house: house,
            area: area,
            city: city,
            landMark: landMark,
            pinCode: pinCode);
      },
      child: Card(
        // color: Color(0xffF7D467),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading,
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: media.width * .7, minWidth: media.width * .7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$nickName',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text('$house $area $landMark $city $pinCode'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//

//
//
