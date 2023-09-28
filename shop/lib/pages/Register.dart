import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/helper/custom-button.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/helper/custom_text.dart';
import 'package:http/http.dart';

import 'package:shop/pages/Login.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/service/auth_cubit.dart';
import 'package:shop/service/auth_states.dart';

class register extends StatelessWidget {
  register({super.key});
  static String id = 'register';
  final namecontrroler = TextEditingController();
  final emailcontrroler = TextEditingController();
  final passcontrroler = TextEditingController();
  final phonecontrroler = TextEditingController();
  String? email;

  String? pass;
  String? phone;

  String? name;

  GlobalKey<FormState> glopalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Authcubit, Authstates>(
      listener: (context, state) {
        if (state is registersucesslstate) {
          // Navigator.pushNamed(context, homepage.id);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Loginshop();
          }));
        } else if (state is failedtoregisterstate) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(state.message),
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: KPrimary2Color,
            appBar: AppBar(
              backgroundColor: KPrimary2Color,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: KPrimaryColor,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: glopalkey,
                child: ListView(
                  children: [
                    Text(
                      'REGISTER',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: KPrimaryColor),
                      selectionColor: Colors.white,
                    ),
                    Text(
                      'login now to browse our hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    customtext(
                      controller: namecontrroler,
                      hinttext: 'Name',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    customtext(
                      controller: emailcontrroler,
                      hinttext: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customtext(
                      controller: passcontrroler,
                      obscureText: true,
                      hinttext: 'password',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customtext(
                      controller: phonecontrroler,
                      hinttext: 'phone',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    custombutton(
                      text: state is registerloadingstate
                          ? "Loading....."
                          : 'Register',
                      ontap: () {
                        if (glopalkey.currentState!.validate()) {
                          BlocProvider.of<Authcubit>(context).register(
                              name: namecontrroler.text,
                              email: emailcontrroler.text,
                              password: passcontrroler.text,
                              phone: phonecontrroler.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account?',
                          style: TextStyle(color: KPrimaryColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Loginshop.id);
                          },
                          child: Text(
                            ' Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 136, 163, 234)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
