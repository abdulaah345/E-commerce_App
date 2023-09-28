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
        color: KPrimary2Color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        title: Text(title!, style: TextStyle(color: Colors.black)),
        leading: Icon(
          leading,
          color: Colors.grey,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.grey,
        ),
      ),
    );
  }
}
