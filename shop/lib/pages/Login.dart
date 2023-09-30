import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:shop/helper/custom-button.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/helper/custom_text.dart';
import 'package:shop/pages/Register.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/service/auth_cubit.dart';
import 'package:shop/service/auth_states.dart';
import 'package:shop/service/navigatorbar.dart';

class Loginshop extends StatelessWidget {
  Loginshop({super.key});
  static String id = 'Login';

  final emailcontrroler = TextEditingController();
  final passcontrroler = TextEditingController();

  String? email;

  String? pass;

  final GlobalKey<FormState> glopalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPromary9color,
        appBar: AppBar(
          backgroundColor: KPromary11color,
          leading: IconButton(
            color: KPromary10color,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: KPromary10color,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: glopalkey,
              child: BlocConsumer<Authcubit, Authstates>(
                listener: (context, state) {
                  if (state is loginsucesslstate) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return navigatorpar();
                    }));
                  }
                  if (state is failedlogingstate) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(state.messsage),
                    )));
                  }
                },
                builder: (context, state) {
                  return ListView(
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: KPromary10color),
                        selectionColor: KPromary11color,
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: KPromary10color),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      customtext(
                        controller: emailcontrroler,
                        onchanged: (data) {
                          email = data;
                        },
                        hinttext: 'Email',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customtext(
                        controller: passcontrroler,
                        onchanged: (data) {
                          pass = data;
                        },
                        obscureText: true,
                        hinttext: 'password',
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      custombutton(
                        ontap: () {
                          if (glopalkey.currentState!.validate() == true) {
                            BlocProvider.of<Authcubit>(context).login(
                                email: emailcontrroler.text,
                                password: passcontrroler.text);
                          }
                        },
                        text: State is loginloadingstate
                            ? "loading...."
                            : 'Login',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dont have an account?',
                            style: TextStyle(color: KPromary10color),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, register.id);
                            },
                            child: Text(
                              ' Register',
                              style: TextStyle(color: KPromary8color),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )),
        ));
  }
}
