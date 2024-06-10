// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siteup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Siteup _$SiteupFromJson(Map<String, dynamic> json) => Siteup(
      code: json['code'] as num?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SiteupToJson(Siteup instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
