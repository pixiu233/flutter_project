import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'siteup.g.dart';

@JsonSerializable()
class Siteup {
	num? code;
	String? message;
	Data? data;

	Siteup({this.code, this.message, this.data});

	@override
	String toString() => 'Siteup(code: $code, message: $message, data: $data)';

	factory Siteup.fromJson(Map<String, dynamic> json) {
		return _$SiteupFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SiteupToJson(this);
}
