import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/models/products.dart';
import 'package:shop/pages/categorydrtails.dart';
import 'package:shop/pages/productdetails.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homepage extends StatelessWidget {
  homepage({super.key});
  final boardcontroller = PageController();
  static String id = 'homepasge';

  @override
  Widget build(BuildContext context) {
    final Cubit = BlocProvider.of<layoutcubit>(context);
    return BlocConsumer<layoutcubit, layoutstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: KPromary9color,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
              child: ListView(
                children: [
                  TextFormField(
                    onChanged: (input) {
                      Cubit.filer(input: input);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: KPromary10color,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(color: KPromary10color),
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Icon(
                          Icons.clear,
                          color: KPromary10color,
                        ),
                        filled: true,
                        fillColor: KPromary11color,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Cubit.banner.isEmpty
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : SizedBox(
                          height: 125,
                          width: double.infinity,
                          child: PageView.builder(
                              controller: boardcontroller,
                              physics: BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Image.network(
                                    Cubit.banner[index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: KPromary10color,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5.0,
                        ),
                        controller: boardcontroller,
                        count: 3),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: KPromary10color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            color: KPromary10color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Cubit.cate.isEmpty
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : SizedBox(
                          height: 125,
                          width: double.infinity,
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: Cubit.cate.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 15,
                                );
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                detailscategory(
                                                  categoryd: Cubit.cate[index],
                                                )));
                                  },
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      Cubit.cate[index].image!,
                                    ),
                                  ),
                                );
                              }),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products',
                        style: TextStyle(
                            color: KPromary10color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            color: KPromary10color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Cubit.products.isEmpty
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Cubit.productsfilter.isEmpty
                              ? Cubit.products.length
                              : Cubit.productsfilter.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 12,
                          ),
                          itemBuilder: ((context, index) {
                            return _productitem(
                                model: Cubit.productsfilter.isEmpty
                                    ? Cubit.products[index]
                                    : Cubit.productsfilter[index],
                                cubit: Cubit,
                                context: context);
                          }))
                ],
              ),
            ),
          );
        });
  }
}

Widget _productitem(
    {required productmodel model,
    required layoutcubit cubit,
    required BuildContext context}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => detailes(product: model)));
        },
        child: Container(
          color: KPromary9color,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(children: [
            Expanded(
                child: Image.network(
              model.image!,
              fit: BoxFit.fill,
            )),
            SizedBox(
              height: 30,
            ),
            Text(
              model.name!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: KPromary10color),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      "${model.price!} \$",
                      style: TextStyle(fontSize: 13, color: KPromary10color),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${model.oldprice!} \$",
                      style: TextStyle(
                          color: KPromary10color,
                          fontSize: 12.5,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )),
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: cubit.favid.contains(model.id.toString())
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onTap: () {
                    cubit.add_or_remove_fav(productid: model.id.toString());
                  },
                )
              ],
            )
          ]),
        ),
      ),
      CircleAvatar(
        backgroundColor: KPromary8color,
        child: GestureDetector(
          onTap: () {
            cubit.add_remmove_cart_with_product(
                pro_cartid: model.id.toString());
          },
          child: Icon(
            Icons.shopping_cart,
            color: cubit.cartsid.contains(model.id.toString())
                ? KPromary9color
                : KPromary10color,
          ),
        ),
      )
    ],
  );
}
