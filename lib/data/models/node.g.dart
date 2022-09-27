// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      id: json['id'] as String,
      type: $enumDecode(_$TypesEnumMap, json['type']),
      data: json['data'] as String,
      edited: const TimestampConverter().fromJson(json['edited'] as Timestamp),
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TypesEnumMap[instance.type],
      'data': instance.data,
      'edited': const TimestampConverter().toJson(instance.edited),
    };

const _$TypesEnumMap = {
  Types.text: 'text',
};
