import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? userId;
  String? username;
  String? email;
  String? avatar;

  Datum({this.userId, this.username, this.email, this.avatar});

  @override
  String toString() {
    return '(userId: $userId, username: $username, email: $email, avatar: $avatar)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
