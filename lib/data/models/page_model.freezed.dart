// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageModel _$PageModelFromJson(Map<String, dynamic> json) {
  return _PageModel.fromJson(json);
}

/// @nodoc
mixin _$PageModel {
  String? get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageModelCopyWith<PageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageModelCopyWith<$Res> {
  factory $PageModelCopyWith(PageModel value, $Res Function(PageModel) then) =
      _$PageModelCopyWithImpl<$Res>;
  $Res call({String? id, @TimestampConverter() DateTime timestamp});
}

/// @nodoc
class _$PageModelCopyWithImpl<$Res> implements $PageModelCopyWith<$Res> {
  _$PageModelCopyWithImpl(this._value, this._then);

  final PageModel _value;
  // ignore: unused_field
  final $Res Function(PageModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_PageModelCopyWith<$Res> implements $PageModelCopyWith<$Res> {
  factory _$$_PageModelCopyWith(
          _$_PageModel value, $Res Function(_$_PageModel) then) =
      __$$_PageModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, @TimestampConverter() DateTime timestamp});
}

/// @nodoc
class __$$_PageModelCopyWithImpl<$Res> extends _$PageModelCopyWithImpl<$Res>
    implements _$$_PageModelCopyWith<$Res> {
  __$$_PageModelCopyWithImpl(
      _$_PageModel _value, $Res Function(_$_PageModel) _then)
      : super(_value, (v) => _then(v as _$_PageModel));

  @override
  _$_PageModel get _value => super._value as _$_PageModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$_PageModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageModel extends _PageModel {
  const _$_PageModel({this.id, @TimestampConverter() required this.timestamp})
      : super._();

  factory _$_PageModel.fromJson(Map<String, dynamic> json) =>
      _$$_PageModelFromJson(json);

  @override
  final String? id;
  @override
  @TimestampConverter()
  final DateTime timestamp;

  @override
  String toString() {
    return 'PageModel(id: $id, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  _$$_PageModelCopyWith<_$_PageModel> get copyWith =>
      __$$_PageModelCopyWithImpl<_$_PageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageModelToJson(this);
  }
}

abstract class _PageModel extends PageModel {
  const factory _PageModel(
      {final String? id,
      @TimestampConverter() required final DateTime timestamp}) = _$_PageModel;
  const _PageModel._() : super._();

  factory _PageModel.fromJson(Map<String, dynamic> json) =
      _$_PageModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PageModelCopyWith<_$_PageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
