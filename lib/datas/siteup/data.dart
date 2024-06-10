import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	String? username;
	num? userId;
	DateTime? createTime;
	DateTime? updateTime;
	String? token;

	Data({
		this.username, 
		this.userId, 
		this.createTime, 
		this.updateTime, 
		this.token, 
	});

	@override
	String toString() {
		return 'Data(username: $username, userId: $userId, createTime: $createTime, updateTime: $updateTime, token: $token)';
	}

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
