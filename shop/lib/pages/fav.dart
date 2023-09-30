import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/products.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';

class fav extends StatelessWidget {
  const fav({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);
    return BlocConsumer<layoutcubit, layoutstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: KPromary9color,
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (v) {
                      cubit.search(inputss: v);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Icon(Icons.clear),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: cubit.searchproductsfiv.isEmpty
                              ? cubit.favlist.length
                              : cubit.searchproductsfiv.length,
                          itemBuilder: (context, index) {
                            return _fivproducts(
                                models: cubit.searchproductsfiv.isEmpty
                                    ? cubit.favlist[index]
                                    : cubit.searchproductsfiv[index],
                                cubit: cubit);
                            // return Container(
                            //   margin: EdgeInsets.symmetric(vertical: 8),
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: 15, horizontal: 12.5),
                            //   color: KPrimary2Color,
                            //   child: Row(
                            //     children: [
                            //       Image.network(
                            //         cubit.favlist[index].image!,
                            //         width: 200,
                            //         height: 100,
                            //         fit: BoxFit.fill,
                            //       ),
                            //       SizedBox(
                            //         width: 10,
                            //       ),
                            //       Expanded(
                            //           child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.center,
                            //         children: [
                            //           Text(
                            //             cubit.favlist[index].name!,
                            //             maxLines: 1,
                            //             style: TextStyle(
                            //                 fontSize: 18,
                            //                 fontWeight: FontWeight.bold,
                            //                 color: KPromary5color),
                            //             overflow: TextOverflow.ellipsis,
                            //           ),
                            //           SizedBox(
                            //             height: 10,
                            //           ),
                            //           Text(
                            //               "${cubit.favlist[index].price!.toString()} \$"),
                            //           MaterialButton(
                            //             onPressed: () {
                            //               cubit.add_or_remove_fav(
                            //                   productid: cubit.favlist[index].id
                            //                       .toString());
                            //             },
                            //             child: Text("Remove"),
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(25)),
                            //             textColor: Colors.white,
                            //             color: Color(0xff676D7E),
                            //           )
                            //         ],
                            //       ))
                            //     ],
                            //   ),
                            // );
                          }))
                ],
              ),
            ),
          );
        });
  }
}

Widget _fivproducts(
    {required productmodel models, required layoutcubit cubit}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12.5),
    color: KPromary9color,
    child: Row(
      children: [
        Center(
          child: Image.network(
            models.image!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              models.name!,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: KPromary10color),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Text("${models.price!.toString()} \$"),
            MaterialButton(
              onPressed: () {
                cubit.add_or_remove_fav(productid: models.id.toString());
              },
              child: Text("Remove"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              textColor: Colors.white,
              color: KPromary11color,
            )
          ],
        ))
      ],
    ),
  );
}
