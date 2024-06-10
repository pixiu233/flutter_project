// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as num?,
      isConfirmed: json['isConfirmed'] as bool?,
      receiver: json['receiver'] == null
          ? null
          : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'isConfirmed': instance.isConfirmed,
      'receiver': instance.receiver,
    };
