// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'thought_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThoughtModel _$ThoughtModelFromJson(Map<String, dynamic> json) {
  return _Thought.fromJson(json);
}

/// @nodoc
mixin _$ThoughtModel {
  String? get id => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThoughtModelCopyWith<ThoughtModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThoughtModelCopyWith<$Res> {
  factory $ThoughtModelCopyWith(
          ThoughtModel value, $Res Function(ThoughtModel) then) =
      _$ThoughtModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? parent,
      @TimestampConverter() DateTime timestamp,
      String data});
}

/// @nodoc
class _$ThoughtModelCopyWithImpl<$Res> implements $ThoughtModelCopyWith<$Res> {
  _$ThoughtModelCopyWithImpl(this._value, this._then);

  final ThoughtModel _value;
  // ignore: unused_field
  final $Res Function(ThoughtModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? parent = freezed,
    Object? timestamp = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ThoughtCopyWith<$Res>
    implements $ThoughtModelCopyWith<$Res> {
  factory _$$_ThoughtCopyWith(
          _$_Thought value, $Res Function(_$_Thought) then) =
      __$$_ThoughtCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? parent,
      @TimestampConverter() DateTime timestamp,
      String data});
}

/// @nodoc
class __$$_ThoughtCopyWithImpl<$Res> extends _$ThoughtModelCopyWithImpl<$Res>
    implements _$$_ThoughtCopyWith<$Res> {
  __$$_ThoughtCopyWithImpl(_$_Thought _value, $Res Function(_$_Thought) _then)
      : super(_value, (v) => _then(v as _$_Thought));

  @override
  _$_Thought get _value => super._value as _$_Thought;

  @override
  $Res call({
    Object? id = freezed,
    Object? parent = freezed,
    Object? timestamp = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_Thought(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thought extends _Thought {
  const _$_Thought(
      {this.id,
      this.parent,
      @TimestampConverter() required this.timestamp,
      required this.data})
      : super._();

  factory _$_Thought.fromJson(Map<String, dynamic> json) =>
      _$$_ThoughtFromJson(json);

  @override
  final String? id;
  @override
  final String? parent;
  @override
  @TimestampConverter()
  final DateTime timestamp;
  @override
  final String data;

  @override
  String toString() {
    return 'ThoughtModel(id: $id, parent: $parent, timestamp: $timestamp, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Thought &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(parent),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_ThoughtCopyWith<_$_Thought> get copyWith =>
      __$$_ThoughtCopyWithImpl<_$_Thought>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThoughtToJson(this);
  }
}

abstract class _Thought extends ThoughtModel {
  const factory _Thought(
      {final String? id,
      final String? parent,
      @TimestampConverter() required final DateTime timestamp,
      required final String data}) = _$_Thought;
  const _Thought._() : super._();

  factory _Thought.fromJson(Map<String, dynamic> json) = _$_Thought.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get parent => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  String get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ThoughtCopyWith<_$_Thought> get copyWith =>
      throw _privateConstructorUsedError;
}
