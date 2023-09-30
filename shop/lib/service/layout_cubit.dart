import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/banners.dart';
import 'package:shop/models/cataegory.dart';
import 'package:shop/models/products.dart';
import 'package:shop/models/user-model.dart';
import 'package:shop/pages/cart.dart';
import 'package:shop/pages/category.dart';
import 'package:shop/pages/fav.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/productdetails.dart';
import 'package:shop/pages/profile.dart';
import 'package:shop/service/constat.dart';
import 'package:shop/service/layout-states.dart';
import 'package:http/http.dart' as http;

class layoutcubit extends Cubit<layoutstates> {
  layoutcubit() : super(laoytinitialstates());
  usermodel? ussermodel;
  int navbarindex = 0;
  List<Widget> screens = [
    homepage(),
    category(),
    fav(),
    cart(),
    profile(),
  ];
  void changebottomnav({required int index}) {
    navbarindex = index;
    emit(changebottomindex());
  }

  List<bannermodel> banner = [];
  void getuserdata() async {
    emit(laoytloadingstates());

    http.Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/profile'), headers: {
      'Authorization': token!,
      'Lang': 'en',
    });

    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == true) {
        ussermodel = usermodel.fromjson(data: responsebody['data']);
        print(responsebody);
        emit(laoytsuccessstates());
      } else {
        print(responsebody);
        emit(laoytfailedlstates(error: responsebody['message']));
      }
    }
  }

  void getbanners() async {
    http.Response response =
        await http.get(Uri.parse('https://student.valuxapps.com/api/banners'));

    final resbonsbody = jsonDecode(response.body);

    if (resbonsbody['status'] == true) {
      for (var item in resbonsbody['data']) {
        banner.add(bannermodel.fromjson(data: item));
      }
      emit(bannersuccess());
    } else {
      emit(bannerfailed());
    }
  }

  List<categorymodel> cate = [];
  void getcategory() async {
    http.Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
      headers: {
        'Lang': 'en',
      },
    );

    final resbonsbody = jsonDecode(response.body);

    if (resbonsbody['status'] == true) {
      for (var item in resbonsbody['data']['data']) {
        cate.add(categorymodel.fromjson(data: item));
        emit(catesuccess());
      }
    } else {
      emit(catefailed());
    }
  }

  List<productmodel> products = [];
  void getproduct() async {
    http.Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/home'), headers: {
      'Authorization': token!,
      'lang': "en",
    });

    final resbonsbody = jsonDecode(response.body);

    if (resbonsbody['status'] == true) {
      for (var item in resbonsbody['data']['products']) {
        products.add(productmodel.fromjson(data: item));
        emit(productssuccess());
      }
    } else {
      emit(productsfailed());
    }
  }

  List<productmodel> productsfilter = [];

  void filer({required String input}) {
    productsfilter = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();

    emit(filterproductsuccess());
  }

  List<productmodel> favlist = [];
  Set<String> favid = {};
  Future<void> getfav() async {
    favlist.clear();
    http.Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/favorites'),
      headers: {
        'Authorization': token!,
        'Lang': 'en',
      },
    );

    final responsbody = jsonDecode(response.body);
    if (responsbody['status'] == true) {
      for (var item in responsbody['data']['data']) {
        favlist.add(productmodel.fromjson(data: item['product']));
        favid.add(item['product']['id'].toString());
      }
      print("fav number:${favlist.length}");
      emit(favsucesss());
    } else {
      emit(favfailed());
    }
  }

  void add_or_remove_fav({required String productid}) async {
    http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {'Lang': 'en', 'Authorization': token!},
        body: {'product_id': productid});

    var responsbody = jsonDecode(response.body);

    if (responsbody['status'] == true) {
      if (favid.contains(productid) == true) {
        favid.remove(productid);
      } else {
        favid.add(productid);
      }
      await getfav();
      emit(add_or_remove_fav_success());
    } else {
      emit(add_or_remove_fav_failed());
    }
  }

  List<productmodel> searchproductsfiv = [];
  void search({required String inputss}) {
    // searchproductsfiv = favlist
    //     .where((element) =>
    //         element.name!.toLowerCase().startsWith(inputss.toLowerCase()))
    //     .toList();

    searchproductsfiv = favlist
        .where((element) =>
            element.name!.toLowerCase().startsWith(inputss.toLowerCase()))
        .toList();
    emit(favsucessfilter());
  }

  List<productmodel> carts = [];
  int totalprice = 0;
  int qyt = 0;
  Set<String> cartsid = {};
  Future<void> getcart() async {
    carts.clear();
    http.Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/carts'), headers: {
      'Authorization': token!,
      'Lang': 'en',
    });

    var responsbody = jsonDecode(response.body);
    totalprice = responsbody['data']['total'].toInt();
    qyt = responsbody['data']['cart_items'].length;
    if (responsbody['status'] == true) {
      for (var item in responsbody['data']['cart_items']) {
        cartsid.add(item['product']['id'].toString());
        carts.add(productmodel.fromjson(data: item['product']));
      }
      emit(cartsucess());
    } else {
      emit(cartfailed());
    }
  }

  void add_remmove_cart_with_product({required String pro_cartid}) async {
    http.Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/carts'), headers: {
      'Lang': 'en',
      'Authorization': token!
    }, body: {
      'product_id': pro_cartid,
    });

    var responsbody = jsonDecode(response.body);

    if (responsbody['status'] == true) {
      cartsid.contains(pro_cartid) == true
          ? cartsid.remove(pro_cartid)
          : cartsid.add(pro_cartid);
      await getcart();
      emit(addtocartsuccess());
    } else {
      emit(addtocartfailed());
    }
  }

  void update({required String quantity}) async {
    http.Response response = await http
        .put(Uri.parse('https://student.valuxapps.com/api/carts/3'), headers: {
      'Lang': 'en',
      'Authorization': token!
    }, body: {
      'quantity': quantity,
    });

    var responsbody = jsonDecode(response.body);

    if (responsbody['status'] == true) {
      emit(addtocartsuccess());
    } else {
      emit(addtocartfailed());
    }
  }

  double total() {
    double total = 0;
    for (var item in carts) {
      total += item.price!;
    }
    return total;
  }
}
