import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/providers/profile_provider.dart';
import 'package:heavy_bucket/screens/drawer/account_screen.dart';
import 'package:heavy_bucket/screens/drawer/my_order.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<ProfileInfoProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          Container(
            // color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomDrawerListTile(
            leadingIcon: Icon(Icons.account_circle),
            titleText: 'My Account',
            function: () {
              Navigator.pushNamed(context, AccountScreen.id);
            },
          ),
          CustomDrawerListTile(
            leadingIcon: Icon(Icons.library_books),
            titleText: 'My Order',
            function: ()=>Navigator.pushNamed(context, MyOrderScreen.id),
          ),
          CustomDrawerListTile(
            leadingIcon: Icon(Icons.phone),
            titleText: 'Customer Service',
            function: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
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
      leading: leadingIcon,
      title: Text(
        titleText,
        style: kStyle3,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: function,
    );
  }
}
