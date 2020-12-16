import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  static const id = 'MyOrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: 8,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sept 23, 2018',
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                  ),),
                  SizedBox(height: 8,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('OD - 424923192 - N',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                SizedBox(height: 4,),
                                Text('price',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
                                SizedBox(height: 16,),
                                RaisedButton()
                              ],
                            ),
                          ),
                          Container(
                              width: 100,
                              height: 120,
                              color: Colors.red,
                              child: Image.network('https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1289&q=80',fit: BoxFit.cover,)),
                        ],
                      ),
                    ),
                  )
                ],

              ),
            )),
      ),
    );
  }
}

