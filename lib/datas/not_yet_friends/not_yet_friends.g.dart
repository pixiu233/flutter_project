// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_yet_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotYetFriends _$NotYetFriendsFromJson(Map<String, dynamic> json) =>
    NotYetFriends(
      code: json['code'] as num?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotYetFriendsToJson(NotYetFriends instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
