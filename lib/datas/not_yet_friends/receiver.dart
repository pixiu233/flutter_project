import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
	num? userId;
	String? username;
	String? avatar;
	num? mobilePhone;
	DateTime? createTime;

	Receiver({
		this.userId, 
		this.username, 
		this.avatar, 
		this.mobilePhone, 
		this.createTime, 
	});

	@override
	String toString() {
		return 'Receiver(userId: $userId, username: $username, avatar: $avatar, mobilePhone: $mobilePhone, createTime: $createTime)';
	}

	factory Receiver.fromJson(Map<String, dynamic> json) {
		return _$ReceiverFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}
