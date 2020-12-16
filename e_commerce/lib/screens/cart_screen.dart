import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:heavy_bucket/screens/checkout/delivery_option_screen.dart';
import 'package:heavy_bucket/widgets/custom_cart_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String lol = ' fsfs';
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          title: Text(
            'Shopping Bag',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: cart.cartListItems.length != 0
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ListView.builder(
                      itemCount: cart.cartListItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {},
                          child: CustomCartCard(
                            itemName: cart.cartListItems[index].itemName,
                            imgUrl: cart.cartListItems[index].itemImg,
                            itemPrice: cart.cartListItems[index].itemPrice,
                            itemQuantity:
                                cart.cartListItems[index].itemQuantity,
                            itemId: cart.cartListItems[index].itemId,
                            index: index,
                          ),
                        );
                      },
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Total Cost',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Roboto-Medium'),
                              ),
                              Text(
                                '${cart.getPrice()}',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Roboto-Bold'),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .50,
                            child: RaisedButton(
                              color: kPrimaryColor,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'CheckOut',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Roboto-Bold'),
                                ),
                              ),
                              onPressed: () {
                                if (cart.getPrice() > 50000) {
                                  print('not goona work');
                                } else {
                                  Navigator.pushNamed(
                                      context, DeliveryOptionScreen.id);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Text(
                  'Cart Empty',
                  style: TextStyle(fontSize: 32),
                ),
              ),
      );
    });
  }
}
