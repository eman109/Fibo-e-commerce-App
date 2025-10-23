import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';

class Dioservice implements Apiconsumer {
  final Dio _dio;
  Dioservice(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  @override
  Future post(String url, Map<String, dynamic> body, {Options? options}) async {
    try {
      final response = await _dio.post(url, data: body, options: options);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get(String url, {Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameter,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(String url, Map<String, dynamic> body) async {
    try {
      final response = await _dio.put(url, data: body);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

//msh ehna bn3ml dio var.post("api url",data{})
//bas fa ehna bnhawel nzbtha bel classess 3mlna api consumer w 3mlna dio var kda mhtage n el
