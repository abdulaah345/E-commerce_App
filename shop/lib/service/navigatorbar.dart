import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/profile.dart';
import 'package:shop/service/layout-states.dart';
import 'package:shop/service/layout_cubit.dart';

class navigatorpar extends StatelessWidget {
  navigatorpar({super.key});
  static String id = 'nav';

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<layoutcubit>(context);
    return BlocConsumer<layoutcubit, layoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: KPrimary2Color,
            title: SvgPicture.network(
              'https://raw.githubusercontent.com/mohamedhashim73/Youtube-Playlist-App/9ecc4ad2fb9c1efc3bc6af77295a21f85cf60fa8/images/logo.svg',
              height: 40,
              width: 40,
              color: KPrimaryColor,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: KPrimary2Color,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: KPrimaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.navbarindex,
              onTap: (index) {
                cubit.changebottomnav(index: index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined), label: 'Categorys'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
          body: cubit.screens[cubit.navbarindex],
        );
      },
    );
  }
}
