// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterPageEntity {
  /// Состояние фильтров
  FiltersEntity get filters => throw _privateConstructorUsedError;

  /// Список всех элементов
  Set<ItemEntity> get items => throw _privateConstructorUsedError;

  /// Состояние подсчета по группам
  CountsEntity get counts => throw _privateConstructorUsedError;

  /// Менджер для управления состоянием фильтров
  FilterStateManager get filtersManager => throw _privateConstructorUsedError;

  /// Состояние открытости/закрытости групп филтров
  TilesStateEntity get filterTilesState => throw _privateConstructorUsedError;

  /// Менеджер для управления состоянием групп фильтров
  FilterTilesStateManager get filterTilesManager =>
      throw _privateConstructorUsedError;

  /// Отфилтрованный список элементов
  Set<ItemEntity> get filteredList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterPageEntityCopyWith<FilterPageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterPageEntityCopyWith<$Res> {
  factory $FilterPageEntityCopyWith(
          FilterPageEntity value, $Res Function(FilterPageEntity) then) =
      _$FilterPageEntityCopyWithImpl<$Res, FilterPageEntity>;
  @useResult
  $Res call(
      {FiltersEntity filters,
      Set<ItemEntity> items,
      CountsEntity counts,
      FilterStateManager filtersManager,
      TilesStateEntity filterTilesState,
      FilterTilesStateManager filterTilesManager,
      Set<ItemEntity> filteredList});

  $FiltersEntityCopyWith<$Res> get filters;
  $CountsEntityCopyWith<$Res> get counts;
  $TilesStateEntityCopyWith<$Res> get filterTilesState;
}

/// @nodoc
class _$FilterPageEntityCopyWithImpl<$Res, $Val extends FilterPageEntity>
    implements $FilterPageEntityCopyWith<$Res> {
  _$FilterPageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? items = null,
    Object? counts = null,
    Object? filtersManager = null,
    Object? filterTilesState = null,
    Object? filterTilesManager = null,
    Object? filteredList = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FiltersEntity,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<ItemEntity>,
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as CountsEntity,
      filtersManager: null == filtersManager
          ? _value.filtersManager
          : filtersManager // ignore: cast_nullable_to_non_nullable
              as FilterStateManager,
      filterTilesState: null == filterTilesState
          ? _value.filterTilesState
          : filterTilesState // ignore: cast_nullable_to_non_nullable
              as TilesStateEntity,
      filterTilesManager: null == filterTilesManager
          ? _value.filterTilesManager
          : filterTilesManager // ignore: cast_nullable_to_non_nullable
              as FilterTilesStateManager,
      filteredList: null == filteredList
          ? _value.filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as Set<ItemEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FiltersEntityCopyWith<$Res> get filters {
    return $FiltersEntityCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountsEntityCopyWith<$Res> get counts {
    return $CountsEntityCopyWith<$Res>(_value.counts, (value) {
      return _then(_value.copyWith(counts: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TilesStateEntityCopyWith<$Res> get filterTilesState {
    return $TilesStateEntityCopyWith<$Res>(_value.filterTilesState, (value) {
      return _then(_value.copyWith(filterTilesState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterPageEntityImplCopyWith<$Res>
    implements $FilterPageEntityCopyWith<$Res> {
  factory _$$FilterPageEntityImplCopyWith(_$FilterPageEntityImpl value,
          $Res Function(_$FilterPageEntityImpl) then) =
      __$$FilterPageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FiltersEntity filters,
      Set<ItemEntity> items,
      CountsEntity counts,
      FilterStateManager filtersManager,
      TilesStateEntity filterTilesState,
      FilterTilesStateManager filterTilesManager,
      Set<ItemEntity> filteredList});

  @override
  $FiltersEntityCopyWith<$Res> get filters;
  @override
  $CountsEntityCopyWith<$Res> get counts;
  @override
  $TilesStateEntityCopyWith<$Res> get filterTilesState;
}

/// @nodoc
class __$$FilterPageEntityImplCopyWithImpl<$Res>
    extends _$FilterPageEntityCopyWithImpl<$Res, _$FilterPageEntityImpl>
    implements _$$FilterPageEntityImplCopyWith<$Res> {
  __$$FilterPageEntityImplCopyWithImpl(_$FilterPageEntityImpl _value,
      $Res Function(_$FilterPageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? items = null,
    Object? counts = null,
    Object? filtersManager = null,
    Object? filterTilesState = null,
    Object? filterTilesManager = null,
    Object? filteredList = null,
  }) {
    return _then(_$FilterPageEntityImpl(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FiltersEntity,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<ItemEntity>,
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as CountsEntity,
      filtersManager: null == filtersManager
          ? _value.filtersManager
          : filtersManager // ignore: cast_nullable_to_non_nullable
              as FilterStateManager,
      filterTilesState: null == filterTilesState
          ? _value.filterTilesState
          : filterTilesState // ignore: cast_nullable_to_non_nullable
              as TilesStateEntity,
      filterTilesManager: null == filterTilesManager
          ? _value.filterTilesManager
          : filterTilesManager // ignore: cast_nullable_to_non_nullable
              as FilterTilesStateManager,
      filteredList: null == filteredList
          ? _value._filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as Set<ItemEntity>,
    ));
  }
}

/// @nodoc

class _$FilterPageEntityImpl implements _FilterPageEntity {
  _$FilterPageEntityImpl(
      {required this.filters,
      required final Set<ItemEntity> items,
      required this.counts,
      required this.filtersManager,
      required this.filterTilesState,
      required this.filterTilesManager,
      final Set<ItemEntity> filteredList = const {}})
      : _items = items,
        _filteredList = filteredList;

  /// Состояние фильтров
  @override
  final FiltersEntity filters;

  /// Список всех элементов
  final Set<ItemEntity> _items;

  /// Список всех элементов
  @override
  Set<ItemEntity> get items {
    if (_items is EqualUnmodifiableSetView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_items);
  }

  /// Состояние подсчета по группам
  @override
  final CountsEntity counts;

  /// Менджер для управления состоянием фильтров
  @override
  final FilterStateManager filtersManager;

  /// Состояние открытости/закрытости групп филтров
  @override
  final TilesStateEntity filterTilesState;

  /// Менеджер для управления состоянием групп фильтров
  @override
  final FilterTilesStateManager filterTilesManager;

  /// Отфилтрованный список элементов
  final Set<ItemEntity> _filteredList;

  /// Отфилтрованный список элементов
  @override
  @JsonKey()
  Set<ItemEntity> get filteredList {
    if (_filteredList is EqualUnmodifiableSetView) return _filteredList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_filteredList);
  }

  @override
  String toString() {
    return 'FilterPageEntity(filters: $filters, items: $items, counts: $counts, filtersManager: $filtersManager, filterTilesState: $filterTilesState, filterTilesManager: $filterTilesManager, filteredList: $filteredList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterPageEntityImpl &&
            (identical(other.filters, filters) || other.filters == filters) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.filtersManager, filtersManager) ||
                other.filtersManager == filtersManager) &&
            (identical(other.filterTilesState, filterTilesState) ||
                other.filterTilesState == filterTilesState) &&
            (identical(other.filterTilesManager, filterTilesManager) ||
                other.filterTilesManager == filterTilesManager) &&
            const DeepCollectionEquality()
                .equals(other._filteredList, _filteredList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filters,
      const DeepCollectionEquality().hash(_items),
      counts,
      filtersManager,
      filterTilesState,
      filterTilesManager,
      const DeepCollectionEquality().hash(_filteredList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterPageEntityImplCopyWith<_$FilterPageEntityImpl> get copyWith =>
      __$$FilterPageEntityImplCopyWithImpl<_$FilterPageEntityImpl>(
          this, _$identity);
}

abstract class _FilterPageEntity implements FilterPageEntity {
  factory _FilterPageEntity(
      {required final FiltersEntity filters,
      required final Set<ItemEntity> items,
      required final CountsEntity counts,
      required final FilterStateManager filtersManager,
      required final TilesStateEntity filterTilesState,
      required final FilterTilesStateManager filterTilesManager,
      final Set<ItemEntity> filteredList}) = _$FilterPageEntityImpl;

  @override

  /// Состояние фильтров
  FiltersEntity get filters;
  @override

  /// Список всех элементов
  Set<ItemEntity> get items;
  @override

  /// Состояние подсчета по группам
  CountsEntity get counts;
  @override

  /// Менджер для управления состоянием фильтров
  FilterStateManager get filtersManager;
  @override

  /// Состояние открытости/закрытости групп филтров
  TilesStateEntity get filterTilesState;
  @override

  /// Менеджер для управления состоянием групп фильтров
  FilterTilesStateManager get filterTilesManager;
  @override

  /// Отфилтрованный список элементов
  Set<ItemEntity> get filteredList;
  @override
  @JsonKey(ignore: true)
  _$$FilterPageEntityImplCopyWith<_$FilterPageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
