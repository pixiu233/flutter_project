import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'friends.g.dart';

@JsonSerializable()
class Friends {
	num? code;
	String? message;
	Data? data;

	Friends({this.code, this.message, this.data});

	@override
	String toString() {
		return 'Friends(code: $code, message: $message, data: $data)';
	}

	factory Friends.fromJson(Map<String, dynamic> json) {
		return _$FriendsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$FriendsToJson(this);
}
