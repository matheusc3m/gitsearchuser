import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    const baseUrl = 'https://api.github.com/';

    options = BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          'Authorization': 'MY_TOKEN',
        });

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
