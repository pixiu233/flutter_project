import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  String? _token; // 这里存储你的Token，可以从SharedPreferences、SecureStorage等获取

  TokenInterceptor(this._token); // 构造函数中传入Token

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 在请求发送前添加Token到请求头
    if (_token != null) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    handler.next(options); // 继续执行下一个拦截器或发送请求
  }
}
