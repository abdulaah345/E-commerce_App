import 'package:flutter/material.dart';
import 'package:shop/helper/custom_color.dart';

class custompro extends StatelessWidget {
  custompro({this.title, this.leading});
  String? title;
  IconData? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KPromary11color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        title: Text(title!, style: TextStyle(color: KPromary10color)),
        leading: Icon(
          leading,
          color: KPromary8color,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: KPromary8color,
        ),
      ),
    );
  }
}
