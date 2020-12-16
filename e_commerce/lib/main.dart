import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/providers/cart_provider.dart';
import 'package:heavy_bucket/providers/profile_provider.dart';
import 'package:heavy_bucket/screens/bottom_navigation_screens/e_commerce_screen.dart';
import 'package:heavy_bucket/screens/bottom_tab_screen.dart';
import 'package:heavy_bucket/screens/cart_screen.dart';
import 'package:heavy_bucket/screens/checkout/delivery_option_screen.dart';
import 'package:heavy_bucket/screens/checkout/payment_screen.dart';
import 'package:heavy_bucket/screens/checkout/select_delivery_address_screen.dart';
import 'package:heavy_bucket/screens/drawer/account_screen.dart';
import 'package:heavy_bucket/screens/drawer/add_address_screen.dart';
import 'package:heavy_bucket/screens/drawer/edit_profile.dart';
import 'package:heavy_bucket/screens/drawer/my_order.dart';
import 'package:heavy_bucket/screens/drawer/shipping_address_screen.dart';
import 'package:heavy_bucket/screens/drawer/wishlist_screen.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/add_detail_page.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/fetch_location_screen.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/location_screen.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/opt_screen.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/splash_screen.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/welcome_screen.dart';
import 'package:heavy_bucket/screens/item_detail_page.dart';
import 'package:provider/provider.dart';


void main() async{
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(create:(_)=>CartProvider()),
        ChangeNotifierProvider<ProfileInfoProvider>(create:(_)=>ProfileInfoProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: kPrimaryColor
          ),
          debugShowCheckedModeBanner: false,
          // home: DeliveryOptionScreen(),
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            OtpScreen.id: (context) => OtpScreen(),
            AddDetailScreen.id:(context)=>AddDetailScreen(),
            FetchLocationScreen.id:(context)=>FetchLocationScreen(),
            LocationScreen.id: (context) => LocationScreen(),
            ItemDetailScreen.id: (context) => ItemDetailScreen(),
            BottomNavigation.id: (context) => BottomNavigation(),
            CartScreen.id: (context) => CartScreen(),
            ECommerceScreen.id:(context)=>ECommerceScreen(),
            AccountScreen.id:(context)=>AccountScreen(),
            EditProfileScreen.id:(context)=>EditProfileScreen(),
            ShippingAddressScreen.id:(context)=>ShippingAddressScreen(),
            AddAddressScreen.id:(context)=>AddAddressScreen(),
            WishListScreen.id:(context)=>WishListScreen(),
            MyOrderScreen.id:(context)=>MyOrderScreen(),
            SelectDeliveryAddressScreen.id:(context)=>SelectDeliveryAddressScreen(),
            DeliveryOptionScreen.id:(context)=>DeliveryOptionScreen(),
            PaymentScreen.id:(context)=>PaymentScreen(),
          },
      ),
    );
  }
}
