import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	num? id;
	bool? isConfirmed;
	DateTime? createdAt;

	Data({this.id, this.isConfirmed, this.createdAt});

	@override
	String toString() {
		return 'Data(id: $id, isConfirmed: $isConfirmed, createdAt: $createdAt)';
	}

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
