import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class Apiconsumer {
  Future<dynamic> post(String url, Map<String, dynamic> body,{ Options? options}); //required lao req w optional lao opt
  Future<dynamic> get(String url,{Map<String, dynamic>? queryParameter});
  Future<dynamic> put(String url, Map<String, dynamic> body);

}


