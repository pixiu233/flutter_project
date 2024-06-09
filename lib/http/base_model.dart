class BaseModel<T> {
  T? data;
  int? code;
  String? message;

  @override
  String toString() {
    return 'TinderUsers(code: $code, message: $message, data: $data)';
  }

  BaseModel.fromJson(dynamic json) {
    data = json['data'];
    code = json['code'];
    message = json['message'];
  }
}
