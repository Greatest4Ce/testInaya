import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/entity/counts_entity/counts_entity.dart';
import 'package:testinaya/domain/entity/filter_page_entity/filter_page_entity.dart';
import 'package:testinaya/domain/entity/filters_state/filter_state/filters_state.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/entity/tiles_state_entity.dart/tiles_state_entity.dart';
import 'package:testinaya/domain/state/filter/filter_state_holder.dart';
import 'package:testinaya/domain/state/filter/filter_state_manager.dart';
import 'package:testinaya/domain/state/filter_tiles/filter_tiles_state_holder.dart';
import 'package:testinaya/domain/state/filter_tiles/filter_tiles_state_manager.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';

final _filterStateHolder =
    StateNotifierProvider<FilterStateHolder, FiltersEntity>((ref) {
  return FilterStateHolder(
    FiltersEntity.raw(
      items: ref.read(itemsStateHolder),
    ),
  );
});

final _filterStateManager = Provider<FilterStateManager>((ref) {
  return FilterStateManager(
    stateHolder: ref.watch(_filterStateHolder.notifier),
  );
});

final _filterTilesStateHolder =
    StateNotifierProvider<FilterTilesStateHolder, TilesStateEntity>((ref) {
  return FilterTilesStateHolder(const TilesStateEntity());
});

final _filterTilesStateManager = Provider<FilterTilesStateManager>((ref) {
  return FilterTilesStateManager(
    stateHolder: ref.watch(_filterTilesStateHolder.notifier),
  );
});

final _countsState = StateProvider<CountsEntity>((ref) {
  final items = ref.watch(itemsStateHolder);
  final filtersState = ref.watch(_filterStateHolder);
  return CountsEntity.fromItemsAndFilters(
    items: items,
    filtersState: filtersState,
  );
});

/// Провайдер, который возваращает состояние страницы фильтров
final filterPageStateHolder =
    StateNotifierProvider<FilterPageStateHolder, FilterPageEntity>((ref) {
  final counts = ref.watch(_countsState);
  final filters = ref.watch(_filterStateHolder);
  final filtersManager = ref.read(_filterStateManager);
  final items = ref.read(itemsStateHolder);
  final filterTilesState = ref.watch(_filterTilesStateHolder);
  final filterTilesManager = ref.read(_filterTilesStateManager);
  return FilterPageStateHolder(
    FilterPageEntity(
      counts: counts,
      filters: filters,
      filtersManager: filtersManager,
      items: items,
      filterTilesState: filterTilesState,
      filterTilesManager: filterTilesManager,
    ),
  );
});

/// Категория фильтров
enum FilterCategory {
  /// По дате
  date,

  /// Минимальная цена
  minPrice,

  /// Максимальная цена
  maxPrice,

  /// Дистанция
  distance,

  /// Тип дома
  houseType,

  /// Минимальное кол-во мест
  minPlacesCount,

  /// Максимальное кол-во мест
  maxPlacesCount,

  /// Места для младенца
  babyPlace,

  /// удобства
  facilities,

  /// Развлечени
  funs,
}

/// Панели категория фильтов
enum FilterTile {
  /// По цене
  price,

  /// По отдаленности
  distance,

  /// По типа дома
  houseType,

  /// кол-во спальных мест
  placesCount,

  /// Удобства
  facilities,

  /// Развлечения
  funs,
}

/// Хранилище состояния страницы фмльтров
class FilterPageStateHolder extends StateNotifier<FilterPageEntity> {
  /// Стандартный конструктор
  FilterPageStateHolder(
    super._state,
  );

  /// Метод, который производит фильтраци по актуальному состоянию фильтров
  void filter() {
    final byPrice = _filterByPrice();
    final byDistance = _filterByDistance();
    final byHouseType = _filterByHouseType();
    final byPlaceCount = _filterByPlaceCount();
    final byFacilities = _filterByFacilites();
    final byFuns = _filterByFuns();
    final set = <Set<ItemEntity>>{
      byPrice,
      byDistance,
      byHouseType,
      byPlaceCount,
      byFacilities,
      byFuns,
    };
    final filteredSet = set.fold(set.first, (a, b) => a.intersection(b));
    state = state.copyWith(filteredList: filteredSet);
  }

  /// Изменение значения фильтра
  void changeFilterValue({
    required FilterCategory filterType,
    required Object value,
    required bool? add,
  }) {
    if (mounted) {
      state.filtersManager.changeFilterValue(
        filterType: filterType,
        value: value,
        add: add,
      );
    }
  }

  /// Очистка фильтров
  void clearFilters() {
    state = state.copyWith(filteredList: {});
    state.filtersManager.clearFilters(items: state.items);
  }

  /// Сброс фильтра "По типу дома"
  void resetHouseFilters() {
    state.filtersManager.resetHouseTypeFilters();
  }

  /// Очистка отфильтрованного списка
  void clearFilteredList() {
    state = state.copyWith(filteredList: {});
  }

  /// Изменние состояния панели группы фильтров
  void changeTileState({
    required FilterTile filterTile,
    required bool value,
  }) {
    state.filterTilesManager.changeTileState(
      filterTile: filterTile,
      value: value,
    );
  }

  Set<ItemEntity> _filterByPrice() {
    final filteredList = state.items.where((item) {
      return state.filters.priceFilter.minPrice <= item.price &&
          item.price <= state.filters.priceFilter.maxPrice;
    }).toSet();
    if (filteredList.isEmpty) {
      return state.items;
    } else {
      return filteredList;
    }
  }

  Set<ItemEntity> _filterByDistance() {
    final filteredList = state.items
        .where((item) => item.distance <= state.filters.distanceFilter)
        .toSet();

    if (filteredList.isEmpty) {
      return state.items;
    } else {
      return filteredList;
    }
  }

  Set<ItemEntity> _filterByHouseType() {
    final filteredList = state.items.where((item) {
      return state.filters.houseFilters.contains(item.type);
    }).toSet();
    if (filteredList.isEmpty) {
      return state.items;
    } else {
      return filteredList;
    }
  }

  Set<ItemEntity> _filterByPlaceCount() {
    final filteredList = state.items.where((item) {
      return state.filters.placeCountFilters.minPlaces <=
              item.sleepPlacesCount &&
          item.sleepPlacesCount <= state.filters.placeCountFilters.maxPlaces;
    }).toSet();
    return filteredList;
  }

  Set<ItemEntity> _filterByFacilites() {
    final filteredList = state.items.where((item) {
      return item.facilities.any(state.filters.facilitiesFilters.contains);
    }).toSet();
    if (filteredList.isEmpty) {
      return state.items;
    } else {
      return filteredList;
    }
  }

  Set<ItemEntity> _filterByFuns() {
    final filteredList = state.items.where((item) {
      return item.funs.any(state.filters.funsFilters.contains);
    }).toSet();
    if (filteredList.isEmpty) {
      return state.items;
    } else {
      return filteredList;
    }
  }
}
