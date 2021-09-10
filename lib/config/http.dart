import 'package:dio/dio.dart';

import 'api/common.dart';

class HttpUtils {
  static Dio? dio;

  static const String baseUrl = goldTagMsRequestUrl;


  static const int connectTimeout = 30000;
  static const int receiveTimeout = 10000;

  static Future<Map> request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'GET';
    Dio dio = createInstance();
    var result;

    try {
      Response response = dio.request(url,
          data: data,
          options: new Options(method: method),) as Response;
      result = response.data;
    } catch (e) {
      print('请求出错：' + e.toString());
    }
    return result;
  }

  static createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: httpHeaders
      );
      dio = new Dio(options);
    }
  }

  static clear() {
    dio = null;
  }
}
