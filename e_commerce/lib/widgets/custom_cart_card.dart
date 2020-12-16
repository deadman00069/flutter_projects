import 'package:flutter/material.dart';
import 'package:heavy_bucket/model/cart_model.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:heavy_bucket/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class CustomCartCard extends StatelessWidget {
  final String itemName;
  final String imgUrl;
  final String itemPrice;
  final String itemQuantity;
  final String itemId;
  final int index;
  CustomCartCard(
      {this.itemName,
      this.imgUrl,
      this.itemPrice,
      this.itemQuantity,
      this.index,
      this.itemId});
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.white,
        child: Container(
          height: 160,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      imgUrl,
                      width: MediaQuery.of(context).size.width * .45,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$itemName',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Roboto-Medium'),
                            ),
                            Text(
                              '₹ $itemPrice',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Roboto-Bold'),
                            ),
                            Container(
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width * .35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Quantity :'),
                                  Container(
                                    color: Color(0xffF4F1F8),
                                    child: Text(
                                      '$itemQuantity',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Roboto-bold'),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        child: Text('REMOVE'),
                        onPressed: () {
                          cart.removeFromCartList(
                              cart.cartListItems[index].itemId);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: RaisedButton(
                        child: Text('MOVE TO WISHLIST'),
                        onPressed: () {
                          cart.addToWishList(
                            Cart(
                                itemId: itemId,
                                itemImg: imgUrl,
                                itemName: itemName,
                                itemQuantity: itemQuantity,
                                itemPrice: itemPrice),
                          );
                          cart.removeFromCartList(
                              cart.cartListItems[index].itemId);
                        },
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
