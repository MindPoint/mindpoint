import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindpoint/methods/utils/id.dart';

import 'converters/timestamp.dart';

part 'node.freezed.dart';
part 'node.g.dart';

enum Types {
  text,
}

@Freezed()
class Node with _$Node {
  const factory Node({
    required String id,
    required Types type,
    required String data,
    @TimestampConverter() required DateTime edited,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  factory Node.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Node.fromJson(data).copyWith(id: doc.id);
  }
}
