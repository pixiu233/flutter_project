import 'package:dio/dio.dart';

import '../base_model.dart';

///处理返回值拦截器
class RspInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
    print('xcccccc');
    // 检查响应状态码
    switch (response.statusCode) {
      case 200:
        // 处理成功的响应
        print('请求成功，状态码：${response.statusCode}');
        // 这里可以添加更多的成功处理逻辑，比如解析数据等
        break;
      case 401:
        // 处理未授权错误
        print('未授权错误，状态码：${response.statusCode}');
        // 根据你的应用逻辑，这里可能需要重定向到登录页面、清除token等操作
        // 注意：若需要终止请求传递，可以使用handler.reject(error)代替handler.next(response)
        break;
      default:
        // 其他状态码的处理逻辑
        print('其他状态码处理，状态码：${response.statusCode}');
        break;
    }

    // 确保调用handler.next(response)以传递响应给下一个处理器或最终的回调
    handler.next(response);
  }
}
