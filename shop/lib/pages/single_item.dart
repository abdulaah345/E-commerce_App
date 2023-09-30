// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop/helper/custom_color.dart';
// import 'package:shop/models/products.dart';
// import 'package:shop/service/layout_cubit.dart';

// class Singleitem extends StatefulWidget {
//   final productmodel productss;

//   Singleitem({required this.productss});

//   @override
//   State<Singleitem> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Singleitem> {
//   int qtn = 0;
//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<layoutcubit>(context);

//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(color: KPrimary2Color),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Image.network(
//                 widget.productss.image!,
//                 height: 100,
//                 width: 100,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(
//                 width: 12.5,
//               ),
//               Expanded(
//                   child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.productss.name!,
//                     maxLines: 1,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: KPromary5color),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text("${widget.productss.price!} \$"),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       if (widget.productss.price != widget.productss.oldprice)
//                         Text(
//                           " ${widget.productss.oldprice!} \$",
//                           style: TextStyle(
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       OutlinedButton(
//                           onPressed: () {
//                             cubit.add_or_remove_fav(
//                                 productid: widget.productss.id.toString());
//                           },
//                           child: Icon(
//                             Icons.favorite,
//                             color: cubit.favid
//                                     .contains(widget.productss.id.toString())
//                                 ? Colors.red
//                                 : Colors.grey,
//                           )),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           cubit.add_remmove_cart_with_product(
//                               pro_cartid: widget.productss.id.toString());
//                         },
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         ),
//                       )
//                     ],
//                   ),
//                   // Row(
//                   //   mainAxisAlignment:
//                   //       MainAxisAlignment.center,
//                   //   children: [
//                   //     ClipOval(
//                   //       child: Material(
//                   //         color: KPrimaryColor,
//                   //         child: GestureDetector(
//                   //           onTap: remove,
//                   //           child: SizedBox(
//                   //             child: Icon(
//                   //               Icons.remove,
//                   //               color: Colors.white,
//                   //             ),
//                   //             width: 28,
//                   //             height: 28,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     // IconButton(
//                   //     //     onPressed: () {
//                   //     //       setState(() {
//                   //     //         if (count != 0) {
//                   //     //           count--;
//                   //     //         }
//                   //     //       });
//                   //     //     },
//                   //     //     icon: Icon(
//                   //     //       Icons.remove,
//                   //     //       size: 20,
//                   //     //     )),
//                   //     SizedBox(
//                   //       width: 20,
//                   //     ),
//                   //     Text("$count".toString(),
//                   //         style: TextStyle(fontSize: 20)),
//                   //     SizedBox(
//                   //       width: 20,
//                   //     ),
//                   //     ClipOval(
//                   //       child: Material(
//                   //         color: KPrimaryColor,
//                   //         child: GestureDetector(
//                   //           onTap: add,
//                   //           child: SizedBox(
//                   //             child: Icon(
//                   //               Icons.add,
//                   //               color: Colors.white,
//                   //             ),
//                   //             width: 28,
//                   //             height: 28,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // )
//                   Row(
//                     children: [
//                       CupertinoButton(
//                           onPressed: () {
//                             if (qtn >= 1)
//                               setState(() {
//                                 qtn--;
//                               });
//                           },
//                           padding: EdgeInsets.zero,
//                           child: CircleAvatar(
//                             maxRadius: 13,
//                             child: Icon(Icons.remove),
//                           )),
//                       Text(
//                         qtn.toString(),
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold),
//                       ),
//                       CupertinoButton(
//                           onPressed: () {
//                             setState(() {
//                               qtn++;
//                             });
//                           },
//                           padding: EdgeInsets.zero,
//                           child: CircleAvatar(
//                             maxRadius: 13,
//                             child: Icon(Icons.add),
//                           )),
//                     ],
//                   )
//                 ],
//               ))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/products.dart';
import 'package:shop/service/layout_cubit.dart';

class Singleitem extends StatefulWidget {
  final productmodel productss;

  Singleitem({required this.productss});

  @override
  State<Singleitem> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Singleitem> {
  int qtn = 1;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: KPromary9color),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                widget.productss.image!,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 12.5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productss.name!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KPromary10color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.productss.price!} \$",
                          style: TextStyle(color: KPromary10color),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (widget.productss.price != widget.productss.oldprice)
                          Text(
                            " ${widget.productss.oldprice!} \$",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: KPromary10color),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            cubit.add_or_remove_fav(
                              productid: widget.productss.id.toString(),
                            );
                          },
                          child: Icon(
                            Icons.favorite,
                            color: cubit.favid.contains(
                              widget.productss.id.toString(),
                            )
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.add_remmove_cart_with_product(
                              pro_cartid: widget.productss.id.toString(),
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: KPromary10color,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            if (qtn >= 1) {
                              setState(() {
                                qtn--;
                                cubit.totalprice -= widget.productss.price!;
                              });
                            }
                          },
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            backgroundColor: KPromary10color,
                            maxRadius: 13,
                            child: Icon(
                              Icons.remove,
                              color: KPromary9color,
                            ),
                          ),
                        ),
                        Text(
                          qtn.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: KPromary10color),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              qtn++;
                              cubit.totalprice += widget.productss.price!;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            backgroundColor: KPromary10color,
                            maxRadius: 13,
                            child: Icon(
                              Icons.add,
                              color: KPromary9color,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Expanded(
                        //   child: Container(
                        //     child: Text(
                        //       "Total Price: \$${widget.productss.price! * qtn} ",
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //         color: KPromary10color,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
