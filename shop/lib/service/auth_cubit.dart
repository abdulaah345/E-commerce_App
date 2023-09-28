import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/service/auth_states.dart';
import 'package:http/http.dart' as http;
import 'package:shop/service/cache-network.dart';

class Authcubit extends Cubit<Authstates> {
  Authcubit() : super(Authintialstate());

  void register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(registerloadingstate());
    try {
      http.Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/register"),
          headers: {
            'Lang': "en"
          },
          body: {
            'name': name,
            'email': email,
            'password': password,
            'phone': phone,
          });
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        if (responsebody['status'] == true) {
          print(responsebody);
          emit(registersucesslstate());
        } else {
          print(responsebody);
          emit(failedtoregisterstate(message: responsebody['message']));
        }
      }
    } catch (e) {
      print('failed to register ,reason :$e');
      emit(failedtoregisterstate(message: e.toString()));
    }
  }

  void login({required String email, required String password}) async {
    try {
      emit(loginloadingstate());
      http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          print('user login success and his data is:$data');
          await cachenetwork.insertcache(
              key: "token", value: data['data']['token']);
          emit(loginsucesslstate());
        } else {
          print('faield to login ,reason is:${data['message']}');
          emit(failedlogingstate(messsage: data['message']));
        }
      }
    } catch (e) {
      emit(failedlogingstate(messsage: e.toString()));
    }
  }
}
