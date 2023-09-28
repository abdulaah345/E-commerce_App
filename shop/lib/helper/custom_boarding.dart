import 'package:flutter/material.dart';

class customboarding extends StatelessWidget {
  customboarding(
      {required this.text1, required this.text2, required this.image});
  String text1;
  String text2;
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(image)),
          SizedBox(
            height: 30.0,
          ),
          Text(
            text1,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(text2,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
