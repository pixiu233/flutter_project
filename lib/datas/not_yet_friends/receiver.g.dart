// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
      userId: json['userId'] as num?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      mobilePhone: json['mobilePhone'] as num?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'avatar': instance.avatar,
      'mobilePhone': instance.mobilePhone,
      'createTime': instance.createTime?.toIso8601String(),
    };
