import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
	String? userId;

	Receiver({this.userId});

	@override
	String toString() => 'Receiver(userId: $userId)';

	factory Receiver.fromJson(Map<String, dynamic> json) {
		return _$ReceiverFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}
