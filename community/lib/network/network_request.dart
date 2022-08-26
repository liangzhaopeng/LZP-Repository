
import 'dart:io';

import 'package:dio/dio.dart';
import 'net_interceptor.dart';
import 'network_config.dart';


class HTTPRqeust {
  static final BaseOptions options = BaseOptions(
    baseUrl: HTTPConfig.baseURL,
    connectTimeout: HTTPConfig.timeout
  );

  static final Dio dio = Dio(options)..interceptors.add(NetInterceptor());


  static Future<T> request<T>(String url,
      {String method = 'get',
        Map<String, dynamic>? params,
        bool isJson = false,
        Interceptor? inter}) async {
    //1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器 --- 此步骤需移至初始化 已经迁移;

    // Interceptor dInter = InterceptorsWrapper(onRequest: (options, handler) {
    //   // 1.在进行任何网络请求的时候, 可以添加一个loading显示
    //   // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token
    //   // 3.对参数进行一些处理,比如序列化处理等
    //   if (kDebugMode) {
    //     print("拦截了请求");
    //   }
    //   handler.next(options);
    // }, onResponse: (response, handle) {
    //   if (kDebugMode) {
    //     print("拦截了响应");
    //   }
    //   handle.next(response);
    // }, onError: (error, handle) {
    //   print("error---$error");
    //   handle.next(error);
    // });
    // List<Interceptor> inters = [dInter];
    // if (inter != null) {
    //   inters.add(inter);
    // }
    // dio.interceptors.add(dInter);

    // 3.发送网络请求
    try {
      url = "${dio.options.baseUrl}web/community/$url";
      print("请求的接口链接为---$url");
      Response response = await dio.request<T>(url, queryParameters: (isJson ? null : params), data: (isJson? params : null), options: options);
      // print("response.data--- $response.data");
      return response.data;
    } on DioError catch (e) {
      // print("request error $e");
      return Future.error(e);
    }

  }

  static Future uploadFiles(String url, List<File> files, {Map<String, dynamic>? params,ProgressCallback? onSendProgress}) async {
    var formData = FormData.fromMap({
      "files": files.map((e) => MultipartFile.fromFileSync(e.path)).toList()
    });

    try {
      url = dio.options.baseUrl + url;
      Response response = await dio.post(url, data:formData, queryParameters: params, onSendProgress: onSendProgress);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

}