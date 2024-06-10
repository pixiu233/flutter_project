import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'not_yet_friends.g.dart';

@JsonSerializable()
class NotYetFriends {
	num? code;
	String? message;
	List<Datum>? data;

	NotYetFriends({this.code, this.message, this.data});

	@override
	String toString() {
		return 'NotYetFriends(code: $code, message: $message, data: $data)';
	}

	factory NotYetFriends.fromJson(Map<String, dynamic> json) {
		return _$NotYetFriendsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NotYetFriendsToJson(this);
}
