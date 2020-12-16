import 'package:flutter/material.dart';
import 'package:heavy_bucket/providers/profile_provider.dart';
import 'package:heavy_bucket/screens/drawer/edit_profile.dart';
import 'package:heavy_bucket/screens/drawer/my_order.dart';
import 'package:heavy_bucket/screens/drawer/shipping_address_screen.dart';
import 'package:heavy_bucket/screens/drawer/wishlist_screen.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static const id='AccountScreen';
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<ProfileInfoProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 64,
                    child: Image.asset('assets/images/drill.png'),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        '${info.firstName} ${info.lastName}',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Roboto-Medium'),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${info.email}',
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'Roboto-Regular'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CustomDrawerListTile(
              leadingIcon: Icon(
                Icons.edit_outlined,
                color: Colors.black,
              ),
              titleText: 'My Profile',
              function: (){
                Navigator.pushNamed(context, EditProfileScreen.id);
              },
            ),
            CustomDrawerListTile(
              leadingIcon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              titleText: 'Shipping Address',
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShippingAddressScreen()),
                );
              },
            ),
            CustomDrawerListTile(
              leadingIcon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              titleText: 'Wishlist',
              function: ()=>Navigator.pushNamed(context, WishListScreen.id),
            ),
            CustomDrawerListTile(
              leadingIcon: Icon(
                Icons.watch_later_outlined,
                color: Colors.black,
              ),
              titleText: 'Order History',
              function: ()=>Navigator.pushNamed(context, MyOrderScreen.id),
            ),
            CustomDrawerListTile(
              leadingIcon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              titleText: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerListTile extends StatelessWidget {
  final Icon leadingIcon;
  final String titleText;
  final Function function;
  CustomDrawerListTile({this.leadingIcon, this.titleText, this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      autofocus: true,
      leading: Container(
        color: Color(0xffFFF5E7),
        padding: EdgeInsets.all(4),
        child: leadingIcon,
      ),
      title: Text(
        titleText,
        style: TextStyle(fontSize: 16, fontFamily: 'Roboto-Regular'),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: function,
    );
  }
}
