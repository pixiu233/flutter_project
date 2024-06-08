import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'home_banner.g.dart';

@JsonSerializable()
class HomeBanner {
	List<Datum>? data;
	num? errorCode;
	String? errorMsg;

	HomeBanner({this.data, this.errorCode, this.errorMsg});

	factory HomeBanner.fromJson(Map<String, dynamic> json) {
		return _$HomeBannerFromJson(json);
	}

	Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}
