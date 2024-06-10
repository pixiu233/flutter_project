import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'check_friends.g.dart';

@JsonSerializable()
class CheckFriends {
	num? code;
	String? message;
	Data? data;

	CheckFriends({this.code, this.message, this.data});

	@override
	String toString() {
		return 'CheckFriends(code: $code, message: $message, data: $data)';
	}

	factory CheckFriends.fromJson(Map<String, dynamic> json) {
		return _$CheckFriendsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CheckFriendsToJson(this);
}
