import 'package:flutter/material.dart';
import 'package:shop/helper/custom_color.dart';

class customtext extends StatelessWidget {
  customtext(
      {required this.controller,
      this.onchanged,
      this.hinttext,
      this.obscureText = false});
  String? hinttext;
  bool? obscureText;
  TextEditingController controller;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: KPrimaryColor),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: KPrimaryColor)),
      ),
    );
  }
}
