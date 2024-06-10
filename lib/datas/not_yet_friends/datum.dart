import 'package:json_annotation/json_annotation.dart';

import 'receiver.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	num? id;
	bool? isConfirmed;
	Receiver? receiver;

	Datum({this.id, this.isConfirmed, this.receiver});

	@override
	String toString() {
		return 'Datum(id: $id, isConfirmed: $isConfirmed, receiver: $receiver)';
	}

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
