import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? userId;
  String? username;
  String? email;
  String? avatar;
  num? mobilePhone;
  DateTime? createTime;
  DateTime? updateTime;
  String? token;

  Data({
    this.userId,
    this.username,
    this.email,
    this.avatar,
    this.mobilePhone,
    this.createTime,
    this.updateTime,
    this.token,
  });

  @override
  String toString() {
    return 'Data(userId: $userId, username: $username, email: $email, avatar: $avatar, mobilePhone: $mobilePhone, createTime: $createTime, updateTime: $updateTime, token: $token)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
