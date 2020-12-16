import 'package:flutter/material.dart';

class CategoryBubble extends StatelessWidget {
  final String url;
  final String categoryName;
  CategoryBubble({this.categoryName, this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 70,
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Color(0xffFFCE33),
              child: ClipOval(
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
               ),
            SizedBox(
              height: 16,
            ),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 14
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
