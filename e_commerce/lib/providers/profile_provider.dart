import 'package:flutter/material.dart';

class ProfileInfoProvider  with ChangeNotifier{
  String firstName;
  String lastName;
  String email;
  ProfileInfoProvider({this.firstName,this.lastName,this.email});
}