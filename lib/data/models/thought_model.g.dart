// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Thought _$$_ThoughtFromJson(Map<String, dynamic> json) => _$_Thought(
      id: json['id'] as String?,
      parent: json['parent'] as String?,
      data: json['data'] as String,
      type: $enumDecode(_$ThoughtTypeEnumMap, json['type']),
      edited: const TimestampConverter().fromJson(json['edited'] as Timestamp),
      created:
          const TimestampConverter().fromJson(json['created'] as Timestamp),
    );

Map<String, dynamic> _$$_ThoughtToJson(_$_Thought instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'data': instance.data,
      'type': _$ThoughtTypeEnumMap[instance.type],
      'edited': const TimestampConverter().toJson(instance.edited),
      'created': const TimestampConverter().toJson(instance.created),
    };

const _$ThoughtTypeEnumMap = {
  ThoughtType.text: 'text',
};
