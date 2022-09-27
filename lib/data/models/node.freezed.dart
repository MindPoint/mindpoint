// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
mixin _$Node {
  String get id => throw _privateConstructorUsedError;
  Types get type => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get edited => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res>;
  $Res call(
      {String id,
      Types type,
      String data,
      @TimestampConverter() DateTime edited});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res> implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  final Node _value;
  // ignore: unused_field
  final $Res Function(Node) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? edited = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Types,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      edited: edited == freezed
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$_NodeCopyWith(_$_Node value, $Res Function(_$_Node) then) =
      __$$_NodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      Types type,
      String data,
      @TimestampConverter() DateTime edited});
}

/// @nodoc
class __$$_NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res>
    implements _$$_NodeCopyWith<$Res> {
  __$$_NodeCopyWithImpl(_$_Node _value, $Res Function(_$_Node) _then)
      : super(_value, (v) => _then(v as _$_Node));

  @override
  _$_Node get _value => super._value as _$_Node;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? edited = freezed,
  }) {
    return _then(_$_Node(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Types,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      edited: edited == freezed
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Node implements _Node {
  const _$_Node(
      {required this.id,
      required this.type,
      required this.data,
      @TimestampConverter() required this.edited});

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

  @override
  final String id;
  @override
  final Types type;
  @override
  final String data;
  @override
  @TimestampConverter()
  final DateTime edited;

  @override
  String toString() {
    return 'Node(id: $id, type: $type, data: $data, edited: $edited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Node &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.edited, edited));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(edited));

  @JsonKey(ignore: true)
  @override
  _$$_NodeCopyWith<_$_Node> get copyWith =>
      __$$_NodeCopyWithImpl<_$_Node>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeToJson(this);
  }
}

abstract class _Node implements Node {
  const factory _Node(
      {required final String id,
      required final Types type,
      required final String data,
      @TimestampConverter() required final DateTime edited}) = _$_Node;

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Types get type => throw _privateConstructorUsedError;
  @override
  String get data => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get edited => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NodeCopyWith<_$_Node> get copyWith => throw _privateConstructorUsedError;
}
