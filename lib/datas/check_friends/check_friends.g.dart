// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckFriends _$CheckFriendsFromJson(Map<String, dynamic> json) => CheckFriends(
      code: json['code'] as num?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckFriendsToJson(CheckFriends instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
