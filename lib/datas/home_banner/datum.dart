import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	String? desc;
	num? id;
	String? imagePath;
	num? isVisible;
	num? order;
	String? title;
	num? type;
	String? url;

	Datum({
		this.desc, 
		this.id, 
		this.imagePath, 
		this.isVisible, 
		this.order, 
		this.title, 
		this.type, 
		this.url, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
