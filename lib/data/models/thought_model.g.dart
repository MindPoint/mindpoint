// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Thought _$$_ThoughtFromJson(Map<String, dynamic> json) => _$_Thought(
      id: json['id'] as String?,
      parent: json['parent'] as String?,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      data: json['data'] as String,
    );

Map<String, dynamic> _$$_ThoughtToJson(_$_Thought instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'data': instance.data,
    };
