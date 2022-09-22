// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NodeModel _$NodeModelFromJson(Map<String, dynamic> json) {
  return _Thought.fromJson(json);
}

/// @nodoc
mixin _$NodeModel {
  String? get id => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  NodeType get type => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeModelCopyWith<NodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeModelCopyWith<$Res> {
  factory $NodeModelCopyWith(NodeModel value, $Res Function(NodeModel) then) =
      _$NodeModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String data,
      NodeType type,
      @TimestampConverter() DateTime created});
}

/// @nodoc
class _$NodeModelCopyWithImpl<$Res> implements $NodeModelCopyWith<$Res> {
  _$NodeModelCopyWithImpl(this._value, this._then);

  final NodeModel _value;
  // ignore: unused_field
  final $Res Function(NodeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? data = freezed,
    Object? type = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NodeType,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_ThoughtCopyWith<$Res> implements $NodeModelCopyWith<$Res> {
  factory _$$_ThoughtCopyWith(
          _$_Thought value, $Res Function(_$_Thought) then) =
      __$$_ThoughtCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String data,
      NodeType type,
      @TimestampConverter() DateTime created});
}

/// @nodoc
class __$$_ThoughtCopyWithImpl<$Res> extends _$NodeModelCopyWithImpl<$Res>
    implements _$$_ThoughtCopyWith<$Res> {
  __$$_ThoughtCopyWithImpl(_$_Thought _value, $Res Function(_$_Thought) _then)
      : super(_value, (v) => _then(v as _$_Thought));

  @override
  _$_Thought get _value => super._value as _$_Thought;

  @override
  $Res call({
    Object? id = freezed,
    Object? data = freezed,
    Object? type = freezed,
    Object? created = freezed,
  }) {
    return _then(_$_Thought(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NodeType,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thought extends _Thought {
  const _$_Thought(
      {this.id,
      required this.data,
      required this.type,
      @TimestampConverter() required this.created})
      : super._();

  factory _$_Thought.fromJson(Map<String, dynamic> json) =>
      _$$_ThoughtFromJson(json);

  @override
  final String? id;
  @override
  final String data;
  @override
  final NodeType type;
  @override
  @TimestampConverter()
  final DateTime created;

  @override
  String toString() {
    return 'NodeModel(id: $id, data: $data, type: $type, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Thought &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$$_ThoughtCopyWith<_$_Thought> get copyWith =>
      __$$_ThoughtCopyWithImpl<_$_Thought>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThoughtToJson(this);
  }
}

abstract class _Thought extends NodeModel {
  const factory _Thought(
      {final String? id,
      required final String data,
      required final NodeType type,
      @TimestampConverter() required final DateTime created}) = _$_Thought;
  const _Thought._() : super._();

  factory _Thought.fromJson(Map<String, dynamic> json) = _$_Thought.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get data => throw _privateConstructorUsedError;
  @override
  NodeType get type => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ThoughtCopyWith<_$_Thought> get copyWith =>
      throw _privateConstructorUsedError;
}
