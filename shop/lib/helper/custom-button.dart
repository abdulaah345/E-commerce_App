import 'package:flutter/material.dart';
import 'package:shop/helper/custom_color.dart';

class custombutton extends StatelessWidget {
  custombutton({this.ontap, required this.text});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: KPrimaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
