import 'package:flutter/material.dart';

class CircleFeed extends StatelessWidget {
  final String url;

  CircleFeed({this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Material(
        elevation: 16,
        clipBehavior: Clip.antiAlias,
        shape: CircleBorder(),
        child: CircleAvatar(
          backgroundImage: AssetImage(url),
          radius: 32,
        ),
      ),
    );
  }
}
