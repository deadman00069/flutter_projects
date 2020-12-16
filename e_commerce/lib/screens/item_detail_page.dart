import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/model/cart_model.dart';
import 'package:heavy_bucket/model/product_detail.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatefulWidget {
  static const id = 'ItemDetailScreen';
  final String productName;
  final int productPrice;
  final String img1Url;
  final String img1Url2;
  final String productId;

  ItemDetailScreen(
      {this.productName,
      this.productPrice,
      this.img1Url,
      this.img1Url2,
      this.productId});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity = 1;
  int displayProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayProduct = widget.productPrice;
    print(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    // final ProductDetail productDetail = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: Stack(
              children: [
                Hero(
                  tag: widget.img1Url,
                  child: Carousel(
                    indicatorBgPadding: 10,
                    dotBgColor: Colors.transparent,
                    images: [
                      NetworkImage(widget.img1Url),
                      NetworkImage(widget.img1Url2),
                    ],
                    animationDuration: Duration(seconds: 1),
                    autoplayDuration: Duration(seconds: 3),
                  ),
                ),
                Positioned(
                    top: 32,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.productName}',
                    style: kRobotBold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      child: Center(
                        child: Text(
                          'Received overcame oh sensible so at an. Formed do change merely to county it. Am separate contempt domestic to to oh. On relation my so addition branched. Put hearing cottage she norland letters equally prepare too. Replied exposed savings he no viewing as up. Soon body add him hill. No father living really people estate if. Mistake do produce beloved demesne if am pursuit.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Roboto-Regular',
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 128,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity = quantity + 1;
                                  displayProduct =
                                      widget.productPrice * quantity;
                                });
                              },
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                            Text('$quantity', style: kRobotoMedium),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (quantity == 1) {
                                    quantity = quantity;
                                  } else {
                                    quantity = quantity - 1;
                                    displayProduct =
                                        widget.productPrice * quantity;
                                  }
                                });
                              },
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₹ $displayProduct',
                        style: kRobotoMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'ADD TO WISHLIST',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'Roboto-Bold'),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              cartProvider.addToWishList(
                                Cart(
                                    itemName: widget.productName,
                                    itemPrice: widget.productPrice.toString(),
                                    itemImg: widget.img1Url,
                                    itemQuantity: quantity.toString(),
                                    itemId: widget.productId),
                              );
                            }),
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'ADD',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Bold'),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            cartProvider.addToCart(
                              Cart(
                                  itemName: widget.productName,
                                  itemPrice: displayProduct.toString(),
                                  itemQuantity: quantity.toString(),
                                  itemImg: widget.img1Url,
                                  itemId: widget.productId),
                            );
                          },
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
