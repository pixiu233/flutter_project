// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tinder_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TinderUsers _$TinderUsersFromJson(Map<String, dynamic> json) => TinderUsers(
      code: json['code'] as num?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TinderUsersToJson(TinderUsers instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
