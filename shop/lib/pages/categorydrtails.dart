import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/cataegory.dart';
import 'package:shop/models/products.dart';

class detailscategory extends StatelessWidget {
  final categorymodel categoryd;
  detailscategory({required this.categoryd});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KPrimary2Color,
          title: SvgPicture.network(
            'https://raw.githubusercontent.com/mohamedhashim73/Youtube-Playlist-App/9ecc4ad2fb9c1efc3bc6af77295a21f85cf60fa8/images/logo.svg',
            height: 40,
            width: 40,
            color: KPrimaryColor,
          ),
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              categoryd.image!, // Assuming 'image' is a URL.
              width: 200, // Set the width as needed.
              height: 200, // Set the height as needed.
              fit: BoxFit.cover, // Adjust the fit as needed.
            ),
            SizedBox(height: 16),
            Text(
              'Category Name: ${categoryd.name}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Category Description: ${categoryd.desc}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Add more details about the category as needed.
          ],
        ),
      ),
    );
  }
}
