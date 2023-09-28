import 'package:flutter/material.dart';
import 'package:shop/helper/custom_color.dart';

class customcon extends StatelessWidget {
  customcon({required this.text, required this.icon, required this.onpressed});
  IconData icon;
  String text;

  VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: KPrimary2Color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
