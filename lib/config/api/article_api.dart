import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application/config/http.dart';
import 'package:http/http.dart' as http;
import 'common.dart';

Dio dio = new Dio();
Map<String, dynamic> params = {'aid': aid, 'uuid': uuid};
Options options = new Options(
    sendTimeout: 10 * 1000, receiveTimeout: 10 * 1000, headers: httpHeaders);
// 获取所有分类
Future getCategories() async {
  // var response = await dio.get(
  //     'https://gold-tag-ms.juejin.im/v1/categories',
  //     options: options,
  //     // queryParameters: params
  // );
  // return response;
  final response = await http.get(
      Uri.parse("https://gold-tag-ms.juejin.im/v1/categories"),
      headers: httpHeaders);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load post');
  }
  }
