import 'package:dio/dio.dart';

import '../base_model.dart';

///处理返回值拦截器
class RspInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // final ssss = response.requestOptions;
    // print('响应接口为:$ssss');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var rsp = BaseModel.fromJson(response.data);
      print(rsp.code);

      if (rsp.code == 200) {
        print(rsp.data);
        if (rsp.data == null) {
          handler.next(
              Response(requestOptions: response.requestOptions, data: true));
        } else {
          // handler.next(Response(
          //     requestOptions: response.requestOptions, data: rsp.data));
        }
      } else if (rsp.code == 401) {
        handler.reject(DioException(
            requestOptions: response.requestOptions, message: "未登录"));
        // showToast("请先登录");
        print('请登录');
      } else {
        handler.reject(DioException(requestOptions: response.requestOptions));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
