import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/timestamp_converter.dart';

part 'thought_model.g.dart';
part 'thought_model.freezed.dart';

enum ThoughtType { text }

@freezed
class ThoughtModel with _$ThoughtModel {
  const ThoughtModel._();

  const factory ThoughtModel({
    String? id,
    String? parent,
    required String data,
    required ThoughtType type,
    @TimestampConverter() required DateTime edited,
    @TimestampConverter() required DateTime created,
  }) = _Thought;

  factory ThoughtModel.fromJson(Map<String, dynamic> json) =>
      _$ThoughtModelFromJson(json);

  factory ThoughtModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return ThoughtModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
