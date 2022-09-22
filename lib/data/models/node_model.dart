import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/timestamp_converter.dart';

part 'node_model.g.dart';
part 'node_model.freezed.dart';

enum NodeType { text }

@freezed
class NodeModel with _$NodeModel {
  const NodeModel._();

  const factory NodeModel({
    String? id,
    required String data,
    required NodeType type,
    @TimestampConverter() required DateTime created,
  }) = _Thought;

  factory NodeModel.fromJson(Map<String, dynamic> json) =>
      _$NodeModelFromJson(json);

  factory NodeModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return NodeModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
