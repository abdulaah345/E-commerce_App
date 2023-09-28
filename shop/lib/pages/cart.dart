import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/products.dart';
import 'package:shop/pages/single_item.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';

class cart extends StatefulWidget {
  cart({super.key});
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);
    return BlocConsumer<layoutcubit, layoutstates>(
      listener: (context, stats) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 12.5,
                ),
                Expanded(
                    child: cubit.carts.isNotEmpty
                        ? ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 12.5,
                              );
                            },
                            itemCount: cubit.carts.length,
                            itemBuilder: (context, index) {
                              return Singleitem(productss: cubit.carts[index]);
                            })
                        : Center(
                            child: Text('Loading....'),
                          )),
                // Container(
                //   child: Text(
                //     " TotalPrice :${cubit.totalprice} ",
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: KPromary5color),
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }

  // remove() {
  //   setState(() {
  //     if (count > 0) {
  //       count--;
  //     }
  //   });
  // }

  // add() {
  //   setState(() {
  //     count++;
  //   });
  // }
}
// Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration:
//                                     BoxDecoration(color: KPrimary2Color),
//                                 child: Row(
//                                   children: [
//                                     Image.network(
//                                       cubit.carts[index].image!,
//                                       height: 100,
//                                       width: 100,
//                                       fit: BoxFit.fill,
//                                     ),
//                                     SizedBox(
//                                       width: 12.5,
//                                     ),
//                                     Expanded(
//                                         child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           cubit.carts[index].name!,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                               color: KPromary5color),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(
//                                                 "${cubit.carts[index].price!} \$"),
//                                             SizedBox(
//                                               width: 5,
//                                             ),
//                                             if (cubit.carts[index].price !=
//                                                 cubit.carts[index].oldprice)
//                                               Text(
//                                                 " ${cubit.carts[index].oldprice!} \$",
//                                                 style: TextStyle(
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                 ),
//                                               ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             OutlinedButton(
//                                                 onPressed: () {
//                                                   cubit.add_or_remove_fav(
//                                                       productid: cubit
//                                                           .carts[index].id
//                                                           .toString());
//                                                 },
//                                                 child: Icon(
//                                                   Icons.favorite,
//                                                   color: cubit.favid.contains(
//                                                           cubit.carts[index].id
//                                                               .toString())
//                                                       ? Colors.red
//                                                       : Colors.grey,
//                                                 )),
//                                             SizedBox(
//                                               width: 5,
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 cubit
//                                                     .add_remmove_cart_with_product(
//                                                         pro_cartid: cubit
//                                                             .carts[index].id
//                                                             .toString());
//                                               },
//                                               child: Icon(
//                                                 Icons.delete,
//                                                 color: Colors.red,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         // Row(
//                                         //   mainAxisAlignment:
//                                         //       MainAxisAlignment.center,
//                                         //   children: [
//                                         //     ClipOval(
//                                         //       child: Material(
//                                         //         color: KPrimaryColor,
//                                         //         child: GestureDetector(
//                                         //           onTap: remove,
//                                         //           child: SizedBox(
//                                         //             child: Icon(
//                                         //               Icons.remove,
//                                         //               color: Colors.white,
//                                         //             ),
//                                         //             width: 28,
//                                         //             height: 28,
//                                         //           ),
//                                         //         ),
//                                         //       ),
//                                         //     ),
//                                         //     // IconButton(
//                                         //     //     onPressed: () {
//                                         //     //       setState(() {
//                                         //     //         if (count != 0) {
//                                         //     //           count--;
//                                         //     //         }
//                                         //     //       });
//                                         //     //     },
//                                         //     //     icon: Icon(
//                                         //     //       Icons.remove,
//                                         //     //       size: 20,
//                                         //     //     )),
//                                         //     SizedBox(
//                                         //       width: 20,
//                                         //     ),
//                                         //     Text("$count".toString(),
//                                         //         style: TextStyle(fontSize: 20)),
//                                         //     SizedBox(
//                                         //       width: 20,
//                                         //     ),
//                                         //     ClipOval(
//                                         //       child: Material(
//                                         //         color: KPrimaryColor,
//                                         //         child: GestureDetector(
//                                         //           onTap: add,
//                                         //           child: SizedBox(
//                                         //             child: Icon(
//                                         //               Icons.add,
//                                         //               color: Colors.white,
//                                         //             ),
//                                         //             width: 28,
//                                         //             height: 28,
//                                         //           ),
//                                         //         ),
//                                         //       ),
//                                         //     ),
//                                         //   ],
//                                         // )
//                                       ],
//                                     ))
//                                   ],
//                                 ),
//                               );