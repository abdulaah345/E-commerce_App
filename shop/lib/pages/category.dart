import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/cataegory.dart';
import 'package:shop/pages/categorydrtails.dart';
import 'package:shop/service/layout_cubit.dart';

class category extends StatelessWidget {
  const category({super.key});
  @override
  Widget build(BuildContext context) {
    List<categorymodel> catedata = BlocProvider.of<layoutcubit>(context).cate;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: GridView.builder(
            itemCount: catedata.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailscategory(
                                categoryd: catedata[index],
                              )));
                },
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          catedata[index].image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(catedata[index].name!)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
