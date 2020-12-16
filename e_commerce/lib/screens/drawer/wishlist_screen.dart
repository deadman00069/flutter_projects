import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/model/cart_model.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:heavy_bucket/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const id = 'WishListScreen';
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WishList',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.id);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: GridView.builder(
          itemCount: list.wishListItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: .6),
          itemBuilder: (context, index) => Card(
              child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(
                        list.wishListItems[index].itemImg,
                        fit: BoxFit.cover,
                      ),
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            list.wishListItems[index].itemName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            list.wishListItems[index].itemPrice,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Move To Bag',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          list.addToCart(
                            Cart(
                                itemName: list.wishListItems[index].itemName,
                                itemQuantity: list.wishListItems[index].itemQuantity,
                                itemPrice: list.wishListItems[index].itemPrice,
                                itemImg: list.wishListItems[index].itemImg,
                                itemId: list.wishListItems[index].itemId),
                          );
                          list.removeFromWishList(
                              list.wishListItems[index].itemId);
                        },
                        color: Colors.white,
                        textColor: kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 8,
                  top: 5,
                  child: ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.red, // inkwell color
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: Icon(
                              Icons.close,
                              size: 14,
                            )),
                        onTap: () {
                          list.removeFromWishList(
                              list.wishListItems[index].itemId);
                          print('clicked');
                        },
                      ),
                    ),
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
