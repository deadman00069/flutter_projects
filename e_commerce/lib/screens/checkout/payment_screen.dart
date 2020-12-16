import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const id = 'PaymentScreen';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          title: Text(
            'Payment',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
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
                          color: Colors.orange,
                        ),
                      ),
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
                          Text('Address'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          height: 1.0,
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
                          Text('Payment'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Select Payment Method',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        border: Border.all(color: Colors.black12),
                        // color: Colors.white38,
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Image.asset('assets/images/razorpay.png'),
                            height: 70,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RazorPay',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text('Click to pay with RazorPay method')
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        border: Border.all(color: Colors.black12),
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Image.asset('assets/images/cash.png'),
                            height: 70,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cash on delivery',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text('Click to pay cash on delivery')
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Confirm'),
                    onPressed: () {},
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
