import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/timestamp.dart';

part 'node.freezed.dart';
part 'node.g.dart';

enum NodeTypes {
  text,
}

@Freezed()
class Node with _$Node {
  const factory Node({
    required NodeTypes type,
    required String data,
    @TimestampConverter() required DateTime timestamp,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  factory Node.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Node.fromJson(data);
  }
}
