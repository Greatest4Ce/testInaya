// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_place_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SleepPlaceEntity {
  SleepPlace get value => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepPlaceEntityCopyWith<SleepPlaceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepPlaceEntityCopyWith<$Res> {
  factory $SleepPlaceEntityCopyWith(
          SleepPlaceEntity value, $Res Function(SleepPlaceEntity) then) =
      _$SleepPlaceEntityCopyWithImpl<$Res, SleepPlaceEntity>;
  @useResult
  $Res call({SleepPlace value, int count});
}

/// @nodoc
class _$SleepPlaceEntityCopyWithImpl<$Res, $Val extends SleepPlaceEntity>
    implements $SleepPlaceEntityCopyWith<$Res> {
  _$SleepPlaceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as SleepPlace,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepPlaceEntityImplCopyWith<$Res>
    implements $SleepPlaceEntityCopyWith<$Res> {
  factory _$$SleepPlaceEntityImplCopyWith(_$SleepPlaceEntityImpl value,
          $Res Function(_$SleepPlaceEntityImpl) then) =
      __$$SleepPlaceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SleepPlace value, int count});
}

/// @nodoc
class __$$SleepPlaceEntityImplCopyWithImpl<$Res>
    extends _$SleepPlaceEntityCopyWithImpl<$Res, _$SleepPlaceEntityImpl>
    implements _$$SleepPlaceEntityImplCopyWith<$Res> {
  __$$SleepPlaceEntityImplCopyWithImpl(_$SleepPlaceEntityImpl _value,
      $Res Function(_$SleepPlaceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? count = null,
  }) {
    return _then(_$SleepPlaceEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as SleepPlace,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SleepPlaceEntityImpl implements _SleepPlaceEntity {
  _$SleepPlaceEntityImpl({required this.value, required this.count});

  @override
  final SleepPlace value;
  @override
  final int count;

  @override
  String toString() {
    return 'SleepPlaceEntity(value: $value, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepPlaceEntityImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepPlaceEntityImplCopyWith<_$SleepPlaceEntityImpl> get copyWith =>
      __$$SleepPlaceEntityImplCopyWithImpl<_$SleepPlaceEntityImpl>(
          this, _$identity);
}

abstract class _SleepPlaceEntity implements SleepPlaceEntity {
  factory _SleepPlaceEntity(
      {required final SleepPlace value,
      required final int count}) = _$SleepPlaceEntityImpl;

  @override
  SleepPlace get value;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$SleepPlaceEntityImplCopyWith<_$SleepPlaceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
