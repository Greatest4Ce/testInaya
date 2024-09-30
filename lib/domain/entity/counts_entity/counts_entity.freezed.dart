// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counts_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountsEntity {
  /// Сколько подходит по датам
  int get countByDate => throw _privateConstructorUsedError;

  /// Сколько подходит по цене
  int get countByPrice => throw _privateConstructorUsedError;

  /// Сколько подходит по отдаленности
  int get countByDistance => throw _privateConstructorUsedError;

  /// Сколько подходит по кол-ву мест
  int get countByPlaceCount => throw _privateConstructorUsedError;

  /// Сколько подходит по типу домов
  int get countByHouse => throw _privateConstructorUsedError;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по типу дома
  Map<HouseType, int> get countByHouseMap => throw _privateConstructorUsedError;

  /// Сколько подходит по удобствам
  int get countByFacilities => throw _privateConstructorUsedError;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по удобствам
  Map<Facility, int> get countByFacilitiesMap =>
      throw _privateConstructorUsedError;

  /// Сколько подходит по развлечениям
  int get countByFuns => throw _privateConstructorUsedError;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по развлечениям
  Map<String, int> get countByFunsMap => throw _privateConstructorUsedError;

  /// Минимальное значение остальны полей
  int get minCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountsEntityCopyWith<CountsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountsEntityCopyWith<$Res> {
  factory $CountsEntityCopyWith(
          CountsEntity value, $Res Function(CountsEntity) then) =
      _$CountsEntityCopyWithImpl<$Res, CountsEntity>;
  @useResult
  $Res call(
      {int countByDate,
      int countByPrice,
      int countByDistance,
      int countByPlaceCount,
      int countByHouse,
      Map<HouseType, int> countByHouseMap,
      int countByFacilities,
      Map<Facility, int> countByFacilitiesMap,
      int countByFuns,
      Map<String, int> countByFunsMap,
      int minCount});
}

/// @nodoc
class _$CountsEntityCopyWithImpl<$Res, $Val extends CountsEntity>
    implements $CountsEntityCopyWith<$Res> {
  _$CountsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countByDate = null,
    Object? countByPrice = null,
    Object? countByDistance = null,
    Object? countByPlaceCount = null,
    Object? countByHouse = null,
    Object? countByHouseMap = null,
    Object? countByFacilities = null,
    Object? countByFacilitiesMap = null,
    Object? countByFuns = null,
    Object? countByFunsMap = null,
    Object? minCount = null,
  }) {
    return _then(_value.copyWith(
      countByDate: null == countByDate
          ? _value.countByDate
          : countByDate // ignore: cast_nullable_to_non_nullable
              as int,
      countByPrice: null == countByPrice
          ? _value.countByPrice
          : countByPrice // ignore: cast_nullable_to_non_nullable
              as int,
      countByDistance: null == countByDistance
          ? _value.countByDistance
          : countByDistance // ignore: cast_nullable_to_non_nullable
              as int,
      countByPlaceCount: null == countByPlaceCount
          ? _value.countByPlaceCount
          : countByPlaceCount // ignore: cast_nullable_to_non_nullable
              as int,
      countByHouse: null == countByHouse
          ? _value.countByHouse
          : countByHouse // ignore: cast_nullable_to_non_nullable
              as int,
      countByHouseMap: null == countByHouseMap
          ? _value.countByHouseMap
          : countByHouseMap // ignore: cast_nullable_to_non_nullable
              as Map<HouseType, int>,
      countByFacilities: null == countByFacilities
          ? _value.countByFacilities
          : countByFacilities // ignore: cast_nullable_to_non_nullable
              as int,
      countByFacilitiesMap: null == countByFacilitiesMap
          ? _value.countByFacilitiesMap
          : countByFacilitiesMap // ignore: cast_nullable_to_non_nullable
              as Map<Facility, int>,
      countByFuns: null == countByFuns
          ? _value.countByFuns
          : countByFuns // ignore: cast_nullable_to_non_nullable
              as int,
      countByFunsMap: null == countByFunsMap
          ? _value.countByFunsMap
          : countByFunsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      minCount: null == minCount
          ? _value.minCount
          : minCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountsEntityImplCopyWith<$Res>
    implements $CountsEntityCopyWith<$Res> {
  factory _$$CountsEntityImplCopyWith(
          _$CountsEntityImpl value, $Res Function(_$CountsEntityImpl) then) =
      __$$CountsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int countByDate,
      int countByPrice,
      int countByDistance,
      int countByPlaceCount,
      int countByHouse,
      Map<HouseType, int> countByHouseMap,
      int countByFacilities,
      Map<Facility, int> countByFacilitiesMap,
      int countByFuns,
      Map<String, int> countByFunsMap,
      int minCount});
}

/// @nodoc
class __$$CountsEntityImplCopyWithImpl<$Res>
    extends _$CountsEntityCopyWithImpl<$Res, _$CountsEntityImpl>
    implements _$$CountsEntityImplCopyWith<$Res> {
  __$$CountsEntityImplCopyWithImpl(
      _$CountsEntityImpl _value, $Res Function(_$CountsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countByDate = null,
    Object? countByPrice = null,
    Object? countByDistance = null,
    Object? countByPlaceCount = null,
    Object? countByHouse = null,
    Object? countByHouseMap = null,
    Object? countByFacilities = null,
    Object? countByFacilitiesMap = null,
    Object? countByFuns = null,
    Object? countByFunsMap = null,
    Object? minCount = null,
  }) {
    return _then(_$CountsEntityImpl(
      countByDate: null == countByDate
          ? _value.countByDate
          : countByDate // ignore: cast_nullable_to_non_nullable
              as int,
      countByPrice: null == countByPrice
          ? _value.countByPrice
          : countByPrice // ignore: cast_nullable_to_non_nullable
              as int,
      countByDistance: null == countByDistance
          ? _value.countByDistance
          : countByDistance // ignore: cast_nullable_to_non_nullable
              as int,
      countByPlaceCount: null == countByPlaceCount
          ? _value.countByPlaceCount
          : countByPlaceCount // ignore: cast_nullable_to_non_nullable
              as int,
      countByHouse: null == countByHouse
          ? _value.countByHouse
          : countByHouse // ignore: cast_nullable_to_non_nullable
              as int,
      countByHouseMap: null == countByHouseMap
          ? _value._countByHouseMap
          : countByHouseMap // ignore: cast_nullable_to_non_nullable
              as Map<HouseType, int>,
      countByFacilities: null == countByFacilities
          ? _value.countByFacilities
          : countByFacilities // ignore: cast_nullable_to_non_nullable
              as int,
      countByFacilitiesMap: null == countByFacilitiesMap
          ? _value._countByFacilitiesMap
          : countByFacilitiesMap // ignore: cast_nullable_to_non_nullable
              as Map<Facility, int>,
      countByFuns: null == countByFuns
          ? _value.countByFuns
          : countByFuns // ignore: cast_nullable_to_non_nullable
              as int,
      countByFunsMap: null == countByFunsMap
          ? _value._countByFunsMap
          : countByFunsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      minCount: null == minCount
          ? _value.minCount
          : minCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CountsEntityImpl implements _CountsEntity {
  const _$CountsEntityImpl(
      {required this.countByDate,
      required this.countByPrice,
      required this.countByDistance,
      required this.countByPlaceCount,
      required this.countByHouse,
      required final Map<HouseType, int> countByHouseMap,
      required this.countByFacilities,
      required final Map<Facility, int> countByFacilitiesMap,
      required this.countByFuns,
      required final Map<String, int> countByFunsMap,
      required this.minCount})
      : _countByHouseMap = countByHouseMap,
        _countByFacilitiesMap = countByFacilitiesMap,
        _countByFunsMap = countByFunsMap;

  /// Сколько подходит по датам
  @override
  final int countByDate;

  /// Сколько подходит по цене
  @override
  final int countByPrice;

  /// Сколько подходит по отдаленности
  @override
  final int countByDistance;

  /// Сколько подходит по кол-ву мест
  @override
  final int countByPlaceCount;

  /// Сколько подходит по типу домов
  @override
  final int countByHouse;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по типу дома
  final Map<HouseType, int> _countByHouseMap;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по типу дома
  @override
  Map<HouseType, int> get countByHouseMap {
    if (_countByHouseMap is EqualUnmodifiableMapView) return _countByHouseMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_countByHouseMap);
  }

  /// Сколько подходит по удобствам
  @override
  final int countByFacilities;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по удобствам
  final Map<Facility, int> _countByFacilitiesMap;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по удобствам
  @override
  Map<Facility, int> get countByFacilitiesMap {
    if (_countByFacilitiesMap is EqualUnmodifiableMapView)
      return _countByFacilitiesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_countByFacilitiesMap);
  }

  /// Сколько подходит по развлечениям
  @override
  final int countByFuns;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по развлечениям
  final Map<String, int> _countByFunsMap;

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по развлечениям
  @override
  Map<String, int> get countByFunsMap {
    if (_countByFunsMap is EqualUnmodifiableMapView) return _countByFunsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_countByFunsMap);
  }

  /// Минимальное значение остальны полей
  @override
  final int minCount;

  @override
  String toString() {
    return 'CountsEntity(countByDate: $countByDate, countByPrice: $countByPrice, countByDistance: $countByDistance, countByPlaceCount: $countByPlaceCount, countByHouse: $countByHouse, countByHouseMap: $countByHouseMap, countByFacilities: $countByFacilities, countByFacilitiesMap: $countByFacilitiesMap, countByFuns: $countByFuns, countByFunsMap: $countByFunsMap, minCount: $minCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountsEntityImpl &&
            (identical(other.countByDate, countByDate) ||
                other.countByDate == countByDate) &&
            (identical(other.countByPrice, countByPrice) ||
                other.countByPrice == countByPrice) &&
            (identical(other.countByDistance, countByDistance) ||
                other.countByDistance == countByDistance) &&
            (identical(other.countByPlaceCount, countByPlaceCount) ||
                other.countByPlaceCount == countByPlaceCount) &&
            (identical(other.countByHouse, countByHouse) ||
                other.countByHouse == countByHouse) &&
            const DeepCollectionEquality()
                .equals(other._countByHouseMap, _countByHouseMap) &&
            (identical(other.countByFacilities, countByFacilities) ||
                other.countByFacilities == countByFacilities) &&
            const DeepCollectionEquality()
                .equals(other._countByFacilitiesMap, _countByFacilitiesMap) &&
            (identical(other.countByFuns, countByFuns) ||
                other.countByFuns == countByFuns) &&
            const DeepCollectionEquality()
                .equals(other._countByFunsMap, _countByFunsMap) &&
            (identical(other.minCount, minCount) ||
                other.minCount == minCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      countByDate,
      countByPrice,
      countByDistance,
      countByPlaceCount,
      countByHouse,
      const DeepCollectionEquality().hash(_countByHouseMap),
      countByFacilities,
      const DeepCollectionEquality().hash(_countByFacilitiesMap),
      countByFuns,
      const DeepCollectionEquality().hash(_countByFunsMap),
      minCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountsEntityImplCopyWith<_$CountsEntityImpl> get copyWith =>
      __$$CountsEntityImplCopyWithImpl<_$CountsEntityImpl>(this, _$identity);
}

abstract class _CountsEntity implements CountsEntity {
  const factory _CountsEntity(
      {required final int countByDate,
      required final int countByPrice,
      required final int countByDistance,
      required final int countByPlaceCount,
      required final int countByHouse,
      required final Map<HouseType, int> countByHouseMap,
      required final int countByFacilities,
      required final Map<Facility, int> countByFacilitiesMap,
      required final int countByFuns,
      required final Map<String, int> countByFunsMap,
      required final int minCount}) = _$CountsEntityImpl;

  @override

  /// Сколько подходит по датам
  int get countByDate;
  @override

  /// Сколько подходит по цене
  int get countByPrice;
  @override

  /// Сколько подходит по отдаленности
  int get countByDistance;
  @override

  /// Сколько подходит по кол-ву мест
  int get countByPlaceCount;
  @override

  /// Сколько подходит по типу домов
  int get countByHouse;
  @override

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по типу дома
  Map<HouseType, int> get countByHouseMap;
  @override

  /// Сколько подходит по удобствам
  int get countByFacilities;
  @override

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по удобствам
  Map<Facility, int> get countByFacilitiesMap;
  @override

  /// Сколько подходит по развлечениям
  int get countByFuns;
  @override

  /// Коллеция, в которой хранятся подсчеты
  /// по конкретынм значениям по развлечениям
  Map<String, int> get countByFunsMap;
  @override

  /// Минимальное значение остальны полей
  int get minCount;
  @override
  @JsonKey(ignore: true)
  _$$CountsEntityImplCopyWith<_$CountsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
