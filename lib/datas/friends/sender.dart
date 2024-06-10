import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender {
	num? userId;

	Sender({this.userId});

	@override
	String toString() => 'Sender(userId: $userId)';

	factory Sender.fromJson(Map<String, dynamic> json) {
		return _$SenderFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SenderToJson(this);
}
