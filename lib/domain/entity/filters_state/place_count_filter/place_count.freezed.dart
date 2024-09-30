// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaceCountEntity {
  int get minPlaces => throw _privateConstructorUsedError;
  int get maxPlaces => throw _privateConstructorUsedError;
  int get babyPlace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceCountEntityCopyWith<PlaceCountEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCountEntityCopyWith<$Res> {
  factory $PlaceCountEntityCopyWith(
          PlaceCountEntity value, $Res Function(PlaceCountEntity) then) =
      _$PlaceCountEntityCopyWithImpl<$Res, PlaceCountEntity>;
  @useResult
  $Res call({int minPlaces, int maxPlaces, int babyPlace});
}

/// @nodoc
class _$PlaceCountEntityCopyWithImpl<$Res, $Val extends PlaceCountEntity>
    implements $PlaceCountEntityCopyWith<$Res> {
  _$PlaceCountEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPlaces = null,
    Object? maxPlaces = null,
    Object? babyPlace = null,
  }) {
    return _then(_value.copyWith(
      minPlaces: null == minPlaces
          ? _value.minPlaces
          : minPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlaces: null == maxPlaces
          ? _value.maxPlaces
          : maxPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      babyPlace: null == babyPlace
          ? _value.babyPlace
          : babyPlace // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceCountEntityImplCopyWith<$Res>
    implements $PlaceCountEntityCopyWith<$Res> {
  factory _$$PlaceCountEntityImplCopyWith(_$PlaceCountEntityImpl value,
          $Res Function(_$PlaceCountEntityImpl) then) =
      __$$PlaceCountEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minPlaces, int maxPlaces, int babyPlace});
}

/// @nodoc
class __$$PlaceCountEntityImplCopyWithImpl<$Res>
    extends _$PlaceCountEntityCopyWithImpl<$Res, _$PlaceCountEntityImpl>
    implements _$$PlaceCountEntityImplCopyWith<$Res> {
  __$$PlaceCountEntityImplCopyWithImpl(_$PlaceCountEntityImpl _value,
      $Res Function(_$PlaceCountEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPlaces = null,
    Object? maxPlaces = null,
    Object? babyPlace = null,
  }) {
    return _then(_$PlaceCountEntityImpl(
      minPlaces: null == minPlaces
          ? _value.minPlaces
          : minPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlaces: null == maxPlaces
          ? _value.maxPlaces
          : maxPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      babyPlace: null == babyPlace
          ? _value.babyPlace
          : babyPlace // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PlaceCountEntityImpl implements _PlaceCountEntity {
  const _$PlaceCountEntityImpl(
      {required this.minPlaces,
      required this.maxPlaces,
      required this.babyPlace});

  @override
  final int minPlaces;
  @override
  final int maxPlaces;
  @override
  final int babyPlace;

  @override
  String toString() {
    return 'PlaceCountEntity(minPlaces: $minPlaces, maxPlaces: $maxPlaces, babyPlace: $babyPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceCountEntityImpl &&
            (identical(other.minPlaces, minPlaces) ||
                other.minPlaces == minPlaces) &&
            (identical(other.maxPlaces, maxPlaces) ||
                other.maxPlaces == maxPlaces) &&
            (identical(other.babyPlace, babyPlace) ||
                other.babyPlace == babyPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minPlaces, maxPlaces, babyPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceCountEntityImplCopyWith<_$PlaceCountEntityImpl> get copyWith =>
      __$$PlaceCountEntityImplCopyWithImpl<_$PlaceCountEntityImpl>(
          this, _$identity);
}

abstract class _PlaceCountEntity implements PlaceCountEntity {
  const factory _PlaceCountEntity(
      {required final int minPlaces,
      required final int maxPlaces,
      required final int babyPlace}) = _$PlaceCountEntityImpl;

  @override
  int get minPlaces;
  @override
  int get maxPlaces;
  @override
  int get babyPlace;
  @override
  @JsonKey(ignore: true)
  _$$PlaceCountEntityImplCopyWith<_$PlaceCountEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
