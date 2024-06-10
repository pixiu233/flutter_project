// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      username: json['username'] as String?,
      userId: json['userId'] as num?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'username': instance.username,
      'userId': instance.userId,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'token': instance.token,
    };
