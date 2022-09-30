import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/timestamp.dart';

part 'node.freezed.dart';
part 'node.g.dart';

enum FirestoreNodeTypes {
  text,
}

@Freezed()
class FirestoreNode with _$FirestoreNode {
  const factory FirestoreNode({
    required FirestoreNodeTypes type,
    required String data,
    @TimestampConverter() required DateTime timestamp,
  }) = _Node;

  factory FirestoreNode.fromJson(Map<String, dynamic> json) =>
      _$FirestoreNodeFromJson(json);

  factory FirestoreNode.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return FirestoreNode.fromJson(data);
  }
}
