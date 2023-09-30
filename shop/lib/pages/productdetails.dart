import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/products.dart';
import 'package:shop/service/layout_cubit.dart';

class detailes extends StatefulWidget {
  final productmodel product;
  detailes({required this.product});

  @override
  State<detailes> createState() => _detailesState();
}

class _detailesState extends State<detailes> {
  @override
  int quantity = 1; // Initial quantity is 1

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);

    return Scaffold(
      backgroundColor: KPromary9color,
      appBar: AppBar(
          backgroundColor: KPromary11color,
          title: SvgPicture.network(
            'https://raw.githubusercontent.com/mohamedhashim73/Youtube-Playlist-App/9ecc4ad2fb9c1efc3bc6af77295a21f85cf60fa8/images/logo.svg',
            height: 40,
            width: 40,
            color: KPromary10color,
          ),
          leading: IconButton(
            color: KPromary10color,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: KPromary10color,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.product.image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.product.name!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: KPromary10color),
              ),
              SizedBox(height: 8),
              Text(
                'Price: \$${widget.product.price}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: KPromary10color),
              ),
              SizedBox(height: 8),
              Text(
                'Old Price: \$${widget.product.oldprice}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    color: KPromary10color),
              ),
              SizedBox(height: 8),
              Text(
                'Description:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: KPromary10color),
              ),
              SizedBox(height: 8),
              Text(
                widget.product.description!,
                style: TextStyle(fontSize: 16, color: KPromary10color),
              ),
              // SizedBox(height: 8),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ClipOval(
              //       child: Material(
              //         color: KPrimaryColor,
              //         child: IconButton(
              //           icon: Icon(Icons.remove),
              //           onPressed: decrementQuantity,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       quantity.toString(),
              //       style: TextStyle(
              //         fontSize: 40,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     ClipOval(
              //       child: Material(
              //         color: KPrimaryColor,
              //         child: IconButton(
              //           icon: Icon(Icons.add),
              //           onPressed: incrementQuantity,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 16),

              // Add to Cart Button
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {

              //     },
              //     style: ElevatedButton.styleFrom(
              //       primary: KPrimaryColor, // Background color
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 20, vertical: 10),
              //       child: Text(
              //         'Add to Cart',
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: F9ontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Center(
              //   child: CircleAvatar(
              //     backgroundColor: KPromary8color,
              //     child: GestureDetector(
              //       onTap: () {
              //         cubit.add_remmove_cart_with_product(
              //             pro_cartid: widget.product.id.toString());
              //       },
              //       child: Icon(
              //         Icons.shopping_cart,
              //         color:
              //             cubit.cartsid.contains(widget.product.id.toString())
              //                 ? KPromary9color
              //                 : KPromary10color,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Center(
              //   child: Container(
              //     child: Text(
              //       " TotalPrice :${widget.product.price! * quantity} ",
              //       style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: KPromary5color),
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
