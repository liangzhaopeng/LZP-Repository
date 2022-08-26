import 'package:dio/dio.dart';


/// 网路请求拦截器
class NetInterceptor extends Interceptor {
  /// 在请求被发送之前做一些事情
  @override
  Future onRequest(RequestOptions options,handler) async {

    Map<String, dynamic> extra = options.extra;
    bool isLoginValid = extra.containsKey("isLoginValid") ? extra['isLoginValid'] : true;
    print("NetInterceptor---$isLoginValid");
    print('NetInterceptor---=========Request============='
        "\n-URL: ${options.baseUrl.toString()}"
        "\n-URL: ${options.path.toString()}"
        "\n-METHOD: ${options.method}\n"
        "\n-Query: ${options.queryParameters.toString()}"
        "\n-HEADER:${options.headers}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('NetInterceptor---=========onResponse============='
        '\n Response-->${response.toString()}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError error,handler) async {
    // 请求失败判断 token 失效刷新 token 重新请求
    if (error.response != null && error.response!.statusCode == 401) {
      try {

      } on DioError catch (e) {
        return e;
      }
    }
    return handler.next(error);
  }

}
