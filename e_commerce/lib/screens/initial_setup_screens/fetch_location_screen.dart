import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:heavy_bucket/constants/colors.dart';
import 'package:heavy_bucket/model/get_location.dart';
import 'package:heavy_bucket/screens/initial_setup_screens/location_screen.dart';

class FetchLocationScreen extends StatelessWidget {
  static const id = 'FetchLocationScreen';
  void getLocation(BuildContext context) async {
    Location location = Location();
    await location.getCurrentLocation().then((value) {
      print(location.latitude);
      getAddress(location.latitude, location.longitude, context);
    });
  }

  void getAddress(double lat, double log, BuildContext context) async {
    final coordinates = new Coordinates(lat, log);
    await Geocoder.local
        .findAddressesFromCoordinates(coordinates)
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            lat: lat,
            lng: log,
            state: value.first.adminArea,
            city: value.first.locality,
            subLocality: value.first.subLocality,
          ),
        ),
      );
      //   print(value.first.subLocality); //your sector
      //   print(value.first.postalCode);
      //   print(value.first.locality);//city
      //   print(value.first.featureName); //exact location
      //   print(value.first.coordinates);
      //   print(value.first.adminArea); //state
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )),
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  child: Text(
                    'Fetching Location Please wait..',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
