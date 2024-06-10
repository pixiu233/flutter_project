import 'package:json_annotation/json_annotation.dart';

import 'receiver.dart';
import 'sender.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	bool? isConfirmed;
	Sender? sender;
	Receiver? receiver;
	num? id;
	DateTime? createdAt;

	Data({
		this.isConfirmed, 
		this.sender, 
		this.receiver, 
		this.id, 
		this.createdAt, 
	});

	@override
	String toString() {
		return 'Data(isConfirmed: $isConfirmed, sender: $sender, receiver: $receiver, id: $id, createdAt: $createdAt)';
	}

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
