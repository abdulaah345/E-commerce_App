import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/helper/custom_pro.dart';
import 'package:shop/helper/customicon.dart';
import 'package:shop/pages/Register.dart';
import 'package:shop/pages/onbording.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';

class profile extends StatelessWidget {
  const profile({super.key});
  static String id = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutcubit, layoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<layoutcubit>(context);
        if (cubit.ussermodel == null) cubit.getuserdata();
        return Scaffold(
            backgroundColor: KPromary9color,
            body: cubit.ussermodel != null
                ? Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Text(cubit.ussermodel!.name!),
                          // SizedBox(height: 10,),
                          // Text(cubit.ussermodel!.email!),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage:
                                      NetworkImage(cubit.ussermodel!.image!))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: KPromary11color,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ListTile(
                              title: Text(cubit.ussermodel!.name!,
                                  style: TextStyle(color: KPromary10color)),
                              leading: Icon(
                                Icons.person,
                                color: KPromary8color,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: KPromary8color,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          custompro(
                            title: cubit.ussermodel!.phone!,
                            leading: Icons.phone,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          custompro(
                            title: cubit.ussermodel!.email!,
                            leading: Icons.mail,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          customcon(
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => onboardung()));
                            },
                            icon: Icons.logout_outlined,
                            text: 'Log out',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          customcon(
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                            },
                            icon: Icons.change_circle_outlined,
                            text: 'Change Email',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
