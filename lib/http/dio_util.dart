
import 'dart:io';
import 'package:dio/dio.dart';
import 'api.dart';
import 'log_interceptiors.dart';

Dio _dio = Dio();
Dio get dio => _dio;

class DioUtils{
  static Future init () async{

    dio.options.baseUrl = Api.BASE_URL;
    dio.options.connectTimeout = 5 *1000;
    dio.options.sendTimeout = 5 *1000;
    dio.options.receiveTimeout =3 * 1000;
    dio.interceptors.add(LogsInterceptors());

  }
}