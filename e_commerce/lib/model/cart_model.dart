import 'package:flutter/cupertino.dart';

class Cart {
  final String itemName;
  final String itemPrice;
  final String itemQuantity;
  final String itemImg;
  final String itemId;
  Cart(
      {@required this.itemName,
      @required this.itemQuantity,
      @required this.itemPrice,
      @required this.itemImg,
      @required this.itemId});
}
