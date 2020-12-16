import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavy_bucket/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _cartListItems = []; //items in cart
  List<Cart> _wishListItems = [];
  List<Cart> get cartListItems => UnmodifiableListView(_cartListItems);
  List<Cart> get wishListItems => UnmodifiableListView(_wishListItems);

  void addToCart(Cart items) {
    //add items to cart
    var item =
        _cartListItems.where((element) => element.itemId == items.itemId);
    if (item.isEmpty) {
      _cartListItems.add(items);
      Fluttertoast.showToast(msg: 'Added to cart');
    } else {
      Fluttertoast.showToast(msg: 'Already exist');
    }

    notifyListeners();
  }

  void addToWishList(Cart items) //add items to wishList
  {
    var item =
        _wishListItems.where((element) => element.itemId == items.itemId);
    if (item.isEmpty) {
      print('empty');
      _wishListItems.add(items);
      Fluttertoast.showToast(msg: 'Added To Wishlist');
    } else {
      Fluttertoast.showToast(msg: 'Already exist');
    }
    notifyListeners();
  }

  void removeFromCartList(String productId) {
    //remove all items from cart
    _cartListItems.removeWhere((element) => element.itemId == productId);
    notifyListeners();
  }

  void removeFromWishList(String productId) {
    _wishListItems.removeWhere((element) => element.itemId == productId);
    notifyListeners();
  }

  //
  int getPrice() {
    //calculate total price of items in cart
    int sum = 0;
    _cartListItems.forEach((element) {
      try {
        sum = int.parse(element.itemPrice) + sum;
      } catch (e) {
        print(e);
      }
    });
    return sum;
  }
}
