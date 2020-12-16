import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/constants/product.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/screens/item_detail_page.dart';
import 'package:heavy_bucket/widgets/category_bubble.dart';
import 'package:heavy_bucket/model/categories_builder.dart';
import 'package:heavy_bucket/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product product = Product();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //for closing app
      onWillPop: () async {
        print('backclicked');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Do u want to exit?',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
                actions: [
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                    child: Text('Exit'),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ],
              );
            });
        return false;
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: EdgeInsets.only(top: 32, left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              color: Color(0xffB7B7B7),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 128,
                          child: ListView.builder(
                            padding: EdgeInsets.all(1),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryBubble(
                                url: categoriesImages[index],
                                categoryName: categories[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Best Selling',
                          style: TextStyle(
                              color: Color(0xffB7B7B7),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Flexible(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection(
                                    'products/categories/sub_categories')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Text('Loading please wait');
                              return GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0,
                                        childAspectRatio: .7),
                                children: snapshot.data.docs.map(
                                  (e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print('hello');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemDetailScreen(
                                                    productName: e.data()[
                                                        'product_description'],
                                                    productPrice: e.data()[
                                                        'product_price'],
                                                    img1Url: e.data()[
                                                        'product_image_url'],
                                                    img1Url2: e.data()[
                                                        'product_img_url2'],
                                                    productId:
                                                        e.data()['product_id'],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag:
                                                  e.data()['product_image_url'],
                                              child: Container(
                                                child: Image.network(
                                                  e.data()['product_image_url'],
                                                  fit: BoxFit.cover,
                                                  // color: Colors.red,
                                                ),
                                                height: 160,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            e.data()['product_description'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            '₹' +
                                                e
                                                    .data()['product_price']
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
