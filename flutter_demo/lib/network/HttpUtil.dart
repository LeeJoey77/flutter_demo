import 'package:dio/dio.dart';
import 'package:flutter_demo/network/url.dart';

class HttpManager {

  static Future<Response> dataRequest(String url, String method, Map<String, dynamic> params) async {
    Dio dio = Dio();
    dio.options.method = method;
    dio.options.connectTimeout = 30 * 1000;
    
    Response response;
    try {
      response = await dio.request(url, data: params); 
    } on DioError catch (error) {
      Response errorResponse;
      if (error.response != null) {
        error.response = errorResponse;
        print(error);
      }


    }
    return response;
  }
  
}