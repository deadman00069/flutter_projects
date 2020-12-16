import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heavy_bucket/constants/style.dart';
import 'package:heavy_bucket/model/get_location.dart';
import 'package:heavy_bucket/screens/fetching_user_details.dart';

import '../bottom_tab_screen.dart';

class LocationScreen extends StatefulWidget {
  static const id = 'LocationScreen';
  final double lat;
  final double lng;
  final String state;
  final String city;
  final String subLocality;
  LocationScreen({this.lat, this.lng, this.state, this.city, this.subLocality});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final Set<Marker> _marker = HashSet<Marker>();

  GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId('0'),
          position: LatLng(widget.lat, widget.lng),
          infoWindow: InfoWindow(
              title: '${widget.city ?? ''}',
              snippet: '${widget.subLocality ?? ''}'),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref
        .collection('users')
        .doc('${user.uid}')
        .collection('location')
        .doc('state')
        .set({'Location': '${widget.state}'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.lat, widget.lng), zoom: 12),
                markers: _marker,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Select location', style: kStyle3),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xffB7B7B7)),
                    bottom: BorderSide(width: 1.0, color: Color(0xffB7B7B7))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your location'),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${widget.subLocality ?? ''} , ${widget.city ?? ''}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Text('CHANGE'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: RaisedButton(
                color: Color(0xffFFCE33),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FetchingUserScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Confirm location & Proceed',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
