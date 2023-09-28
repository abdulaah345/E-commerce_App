import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/pages/Login.dart';
import 'package:shop/pages/Register.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/onbording.dart';
import 'package:shop/pages/profile.dart';
import 'package:shop/service/auth_cubit.dart';
import 'package:shop/service/cache-network.dart';
import 'package:shop/service/constat.dart';
import 'package:shop/service/layout_cubit.dart';
import 'package:shop/service/navigatorbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cachenetwork.cacheInitialization();
  token = cachenetwork.getcachedata(key: 'token');
  print(token);
  runApp(const homepag());
}

class homepag extends StatelessWidget {
  const homepag({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Authcubit()),
        BlocProvider(
            create: (context) => layoutcubit()
              ..getcart()
              ..getfav()
              ..getbanners()
              ..getcategory()
              ..getproduct())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            onboardung.id: (context) => onboardung(),
            Loginshop.id: (context) => Loginshop(),
            register.id: (context) => register(),
            homepage.id: (context) => homepage(),
            profile.id: (context) => profile(),
            navigatorpar.id: (context) => navigatorpar(),
          },
          initialRoute:
              token != null && token != "" ? navigatorpar.id : Loginshop.id),
    );
  }
}
