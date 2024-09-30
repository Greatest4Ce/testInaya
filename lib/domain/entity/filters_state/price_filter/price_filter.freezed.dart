// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceFilterEntity {
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceFilterEntityCopyWith<PriceFilterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceFilterEntityCopyWith<$Res> {
  factory $PriceFilterEntityCopyWith(
          PriceFilterEntity value, $Res Function(PriceFilterEntity) then) =
      _$PriceFilterEntityCopyWithImpl<$Res, PriceFilterEntity>;
  @useResult
  $Res call({int minPrice, int maxPrice});
}

/// @nodoc
class _$PriceFilterEntityCopyWithImpl<$Res, $Val extends PriceFilterEntity>
    implements $PriceFilterEntityCopyWith<$Res> {
  _$PriceFilterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_value.copyWith(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceFilterEntityImplCopyWith<$Res>
    implements $PriceFilterEntityCopyWith<$Res> {
  factory _$$PriceFilterEntityImplCopyWith(_$PriceFilterEntityImpl value,
          $Res Function(_$PriceFilterEntityImpl) then) =
      __$$PriceFilterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minPrice, int maxPrice});
}

/// @nodoc
class __$$PriceFilterEntityImplCopyWithImpl<$Res>
    extends _$PriceFilterEntityCopyWithImpl<$Res, _$PriceFilterEntityImpl>
    implements _$$PriceFilterEntityImplCopyWith<$Res> {
  __$$PriceFilterEntityImplCopyWithImpl(_$PriceFilterEntityImpl _value,
      $Res Function(_$PriceFilterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
  }) {
    return _then(_$PriceFilterEntityImpl(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PriceFilterEntityImpl implements _PriceFilterEntity {
  const _$PriceFilterEntityImpl(
      {required this.minPrice, required this.maxPrice});

  @override
  final int minPrice;
  @override
  final int maxPrice;

  @override
  String toString() {
    return 'PriceFilterEntity(minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceFilterEntityImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minPrice, maxPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceFilterEntityImplCopyWith<_$PriceFilterEntityImpl> get copyWith =>
      __$$PriceFilterEntityImplCopyWithImpl<_$PriceFilterEntityImpl>(
          this, _$identity);
}

abstract class _PriceFilterEntity implements PriceFilterEntity {
  const factory _PriceFilterEntity(
      {required final int minPrice,
      required final int maxPrice}) = _$PriceFilterEntityImpl;

  @override
  int get minPrice;
  @override
  int get maxPrice;
  @override
  @JsonKey(ignore: true)
  _$$PriceFilterEntityImplCopyWith<_$PriceFilterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
