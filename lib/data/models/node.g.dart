// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      type: $enumDecode(_$FirestoreNodeTypesEnumMap, json['type']),
      data: json['data'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'type': _$FirestoreNodeTypesEnumMap[instance.type],
      'data': instance.data,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

const _$FirestoreNodeTypesEnumMap = {
  FirestoreNodeTypes.text: 'text',
};
