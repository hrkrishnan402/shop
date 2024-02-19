import 'package:dio/dio.dart';
import 'package:test_app/common/constants/app_strings.dart';

class HttpHandler extends Interceptor {
  final Dio _dio;
  final Map<String, dynamic>? commonHeaders;

  HttpHandler(this._dio, {this.commonHeaders});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (commonHeaders != null) {
      options.headers.addAll(commonHeaders!);
    }

    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error: ${err.type}, ${err.message}');

    handler.next(err);
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool primaryUrl = true,
  }) async {
    final options = Options(headers: headers);
    return await _dio.get(
        primaryUrl
            ? AppStrings.baseApiUrl + url
            : AppStrings.baseSecondaryApiUrl + url,
        options: options,
        queryParameters: queryParameters);
  }

  Future<Response<dynamic>> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    Options? options,
    bool primaryUrl = true,
  }) async {
    return await _dio.post(
        primaryUrl
            ? AppStrings.baseApiUrl + url
            : AppStrings.baseSecondaryApiUrl + url,
        data: data,
        options: options ?? Options(headers: headers));
  }
}
