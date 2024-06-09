import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'tinder_users.g.dart';

@JsonSerializable()
class TinderUsers {
	num? code;
	String? message;
	List<Datum>? data;

	TinderUsers({this.code, this.message, this.data});

	@override
	String toString() {
		return 'TinderUsers(code: $code, message: $message, data: $data)';
	}

	factory TinderUsers.fromJson(Map<String, dynamic> json) {
		return _$TinderUsersFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TinderUsersToJson(this);
}
