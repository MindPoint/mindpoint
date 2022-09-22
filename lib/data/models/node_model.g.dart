// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Thought _$$_ThoughtFromJson(Map<String, dynamic> json) => _$_Thought(
      id: json['id'] as String?,
      data: json['data'] as String,
      type: $enumDecode(_$NodeTypeEnumMap, json['type']),
      created: const TimestampConverter().fromJson(json['created'] as String),
    );

Map<String, dynamic> _$$_ThoughtToJson(_$_Thought instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'type': _$NodeTypeEnumMap[instance.type],
      'created': const TimestampConverter().toJson(instance.created),
    };

const _$NodeTypeEnumMap = {
  NodeType.text: 'text',
};
