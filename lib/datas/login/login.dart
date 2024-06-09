import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  num? code;
  String? message;
  Data? data;

  Login({this.code, this.message, this.data});

  @override
  String toString() => 'Login(code: $code, message: $message, data: $data)';

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
