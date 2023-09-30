import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom-button.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';

class buy extends StatefulWidget {
  const buy({super.key});

  @override
  State<buy> createState() => _buyState();
}

class _buyState extends State<buy> {
  int groupvalue = 1;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);
    return BlocConsumer<layoutcubit, layoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TotalPrice',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: KPromary10color),
                      ),
                      Text(
                        '\$ ${cubit.totalprice} ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: KPromary10color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  custombutton(
                    text: "Checkout",
                    ontap: () {},
                  )
                ],
              ),
            ),
          ),
          backgroundColor: KPromary9color,
          appBar: AppBar(
            backgroundColor: KPromary11color,
            centerTitle: true,
            title: Text(
              'Checkout',
              style: TextStyle(color: KPromary10color),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 36.0,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: KPromary10color)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomRadio(
                        value: 1,
                        groupValue: groupvalue,
                        onChanged: (value) {
                          setState(() {
                            groupvalue = value;
                          });
                        },
                      ),
                      Icon(
                        Icons.money,
                        color: KPromary10color,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cash on Delivery',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: KPromary10color),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: KPromary10color)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomRadio(
                        value: 2,
                        groupValue: groupvalue,
                        onChanged: (value) {
                          setState(() {
                            groupvalue = value;
                          });
                        },
                      ),
                      Icon(
                        Icons.money,
                        color: KPromary10color,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Pay Online ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: KPromary10color),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  const CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? KPromary10color : Colors.grey[200]),
        child: Icon(
          Icons.circle,
          size: 15,
          color: selected ? KPromary8color : Colors.grey[200],
        ),
      ),
    );
  }
}
