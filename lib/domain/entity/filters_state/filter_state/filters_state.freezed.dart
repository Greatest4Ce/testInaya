// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FiltersEntity {
  PriceFilterEntity get priceFilter => throw _privateConstructorUsedError;
  int get distanceFilter => throw _privateConstructorUsedError;
  PlaceCountEntity get placeCountFilters => throw _privateConstructorUsedError;
  Set<DateTime>? get dates => throw _privateConstructorUsedError;
  Set<HouseType> get houseFilters => throw _privateConstructorUsedError;
  Set<Facility> get facilitiesFilters => throw _privateConstructorUsedError;
  Set<String> get funsFilters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersEntityCopyWith<FiltersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersEntityCopyWith<$Res> {
  factory $FiltersEntityCopyWith(
          FiltersEntity value, $Res Function(FiltersEntity) then) =
      _$FiltersEntityCopyWithImpl<$Res, FiltersEntity>;
  @useResult
  $Res call(
      {PriceFilterEntity priceFilter,
      int distanceFilter,
      PlaceCountEntity placeCountFilters,
      Set<DateTime>? dates,
      Set<HouseType> houseFilters,
      Set<Facility> facilitiesFilters,
      Set<String> funsFilters});

  $PriceFilterEntityCopyWith<$Res> get priceFilter;
  $PlaceCountEntityCopyWith<$Res> get placeCountFilters;
}

/// @nodoc
class _$FiltersEntityCopyWithImpl<$Res, $Val extends FiltersEntity>
    implements $FiltersEntityCopyWith<$Res> {
  _$FiltersEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceFilter = null,
    Object? distanceFilter = null,
    Object? placeCountFilters = null,
    Object? dates = freezed,
    Object? houseFilters = null,
    Object? facilitiesFilters = null,
    Object? funsFilters = null,
  }) {
    return _then(_value.copyWith(
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilterEntity,
      distanceFilter: null == distanceFilter
          ? _value.distanceFilter
          : distanceFilter // ignore: cast_nullable_to_non_nullable
              as int,
      placeCountFilters: null == placeCountFilters
          ? _value.placeCountFilters
          : placeCountFilters // ignore: cast_nullable_to_non_nullable
              as PlaceCountEntity,
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>?,
      houseFilters: null == houseFilters
          ? _value.houseFilters
          : houseFilters // ignore: cast_nullable_to_non_nullable
              as Set<HouseType>,
      facilitiesFilters: null == facilitiesFilters
          ? _value.facilitiesFilters
          : facilitiesFilters // ignore: cast_nullable_to_non_nullable
              as Set<Facility>,
      funsFilters: null == funsFilters
          ? _value.funsFilters
          : funsFilters // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceFilterEntityCopyWith<$Res> get priceFilter {
    return $PriceFilterEntityCopyWith<$Res>(_value.priceFilter, (value) {
      return _then(_value.copyWith(priceFilter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceCountEntityCopyWith<$Res> get placeCountFilters {
    return $PlaceCountEntityCopyWith<$Res>(_value.placeCountFilters, (value) {
      return _then(_value.copyWith(placeCountFilters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FiltersEntityImplCopyWith<$Res>
    implements $FiltersEntityCopyWith<$Res> {
  factory _$$FiltersEntityImplCopyWith(
          _$FiltersEntityImpl value, $Res Function(_$FiltersEntityImpl) then) =
      __$$FiltersEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PriceFilterEntity priceFilter,
      int distanceFilter,
      PlaceCountEntity placeCountFilters,
      Set<DateTime>? dates,
      Set<HouseType> houseFilters,
      Set<Facility> facilitiesFilters,
      Set<String> funsFilters});

  @override
  $PriceFilterEntityCopyWith<$Res> get priceFilter;
  @override
  $PlaceCountEntityCopyWith<$Res> get placeCountFilters;
}

/// @nodoc
class __$$FiltersEntityImplCopyWithImpl<$Res>
    extends _$FiltersEntityCopyWithImpl<$Res, _$FiltersEntityImpl>
    implements _$$FiltersEntityImplCopyWith<$Res> {
  __$$FiltersEntityImplCopyWithImpl(
      _$FiltersEntityImpl _value, $Res Function(_$FiltersEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceFilter = null,
    Object? distanceFilter = null,
    Object? placeCountFilters = null,
    Object? dates = freezed,
    Object? houseFilters = null,
    Object? facilitiesFilters = null,
    Object? funsFilters = null,
  }) {
    return _then(_$FiltersEntityImpl(
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilterEntity,
      distanceFilter: null == distanceFilter
          ? _value.distanceFilter
          : distanceFilter // ignore: cast_nullable_to_non_nullable
              as int,
      placeCountFilters: null == placeCountFilters
          ? _value.placeCountFilters
          : placeCountFilters // ignore: cast_nullable_to_non_nullable
              as PlaceCountEntity,
      dates: freezed == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>?,
      houseFilters: null == houseFilters
          ? _value._houseFilters
          : houseFilters // ignore: cast_nullable_to_non_nullable
              as Set<HouseType>,
      facilitiesFilters: null == facilitiesFilters
          ? _value._facilitiesFilters
          : facilitiesFilters // ignore: cast_nullable_to_non_nullable
              as Set<Facility>,
      funsFilters: null == funsFilters
          ? _value._funsFilters
          : funsFilters // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$FiltersEntityImpl implements _FiltersEntity {
  const _$FiltersEntityImpl(
      {required this.priceFilter,
      required this.distanceFilter,
      required this.placeCountFilters,
      final Set<DateTime>? dates,
      final Set<HouseType> houseFilters = const {},
      final Set<Facility> facilitiesFilters = const {},
      final Set<String> funsFilters = const {}})
      : _dates = dates,
        _houseFilters = houseFilters,
        _facilitiesFilters = facilitiesFilters,
        _funsFilters = funsFilters;

  @override
  final PriceFilterEntity priceFilter;
  @override
  final int distanceFilter;
  @override
  final PlaceCountEntity placeCountFilters;
  final Set<DateTime>? _dates;
  @override
  Set<DateTime>? get dates {
    final value = _dates;
    if (value == null) return null;
    if (_dates is EqualUnmodifiableSetView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  final Set<HouseType> _houseFilters;
  @override
  @JsonKey()
  Set<HouseType> get houseFilters {
    if (_houseFilters is EqualUnmodifiableSetView) return _houseFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_houseFilters);
  }

  final Set<Facility> _facilitiesFilters;
  @override
  @JsonKey()
  Set<Facility> get facilitiesFilters {
    if (_facilitiesFilters is EqualUnmodifiableSetView)
      return _facilitiesFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_facilitiesFilters);
  }

  final Set<String> _funsFilters;
  @override
  @JsonKey()
  Set<String> get funsFilters {
    if (_funsFilters is EqualUnmodifiableSetView) return _funsFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_funsFilters);
  }

  @override
  String toString() {
    return 'FiltersEntity(priceFilter: $priceFilter, distanceFilter: $distanceFilter, placeCountFilters: $placeCountFilters, dates: $dates, houseFilters: $houseFilters, facilitiesFilters: $facilitiesFilters, funsFilters: $funsFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltersEntityImpl &&
            (identical(other.priceFilter, priceFilter) ||
                other.priceFilter == priceFilter) &&
            (identical(other.distanceFilter, distanceFilter) ||
                other.distanceFilter == distanceFilter) &&
            (identical(other.placeCountFilters, placeCountFilters) ||
                other.placeCountFilters == placeCountFilters) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality()
                .equals(other._houseFilters, _houseFilters) &&
            const DeepCollectionEquality()
                .equals(other._facilitiesFilters, _facilitiesFilters) &&
            const DeepCollectionEquality()
                .equals(other._funsFilters, _funsFilters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      priceFilter,
      distanceFilter,
      placeCountFilters,
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_houseFilters),
      const DeepCollectionEquality().hash(_facilitiesFilters),
      const DeepCollectionEquality().hash(_funsFilters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltersEntityImplCopyWith<_$FiltersEntityImpl> get copyWith =>
      __$$FiltersEntityImplCopyWithImpl<_$FiltersEntityImpl>(this, _$identity);
}

abstract class _FiltersEntity implements FiltersEntity {
  const factory _FiltersEntity(
      {required final PriceFilterEntity priceFilter,
      required final int distanceFilter,
      required final PlaceCountEntity placeCountFilters,
      final Set<DateTime>? dates,
      final Set<HouseType> houseFilters,
      final Set<Facility> facilitiesFilters,
      final Set<String> funsFilters}) = _$FiltersEntityImpl;

  @override
  PriceFilterEntity get priceFilter;
  @override
  int get distanceFilter;
  @override
  PlaceCountEntity get placeCountFilters;
  @override
  Set<DateTime>? get dates;
  @override
  Set<HouseType> get houseFilters;
  @override
  Set<Facility> get facilitiesFilters;
  @override
  Set<String> get funsFilters;
  @override
  @JsonKey(ignore: true)
  _$$FiltersEntityImplCopyWith<_$FiltersEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
