import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testinaya/domain/entity/filters_state/filter_state/filters_state.dart';
import 'package:testinaya/domain/entity/filters_state/place_count_filter/place_count.dart';
import 'package:testinaya/domain/entity/filters_state/price_filter/price_filter.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';

part 'counts_entity.freezed.dart';
// part 'counts_entity.g.dart';

@freezed

/// Модель для подсчетов на странице фильтров
class CountsEntity with _$CountsEntity {
  /// Основной констркутор
  const factory CountsEntity({
    /// Сколько подходит по датам
    required int countByDate,

    /// Сколько подходит по цене
    required int countByPrice,

    /// Сколько подходит по отдаленности
    required int countByDistance,

    /// Сколько подходит по кол-ву мест
    required int countByPlaceCount,

    /// Сколько подходит по типу домов
    required int countByHouse,

    /// Коллеция, в которой хранятся подсчеты
    /// по конкретынм значениям по типу дома
    required Map<HouseType, int> countByHouseMap,

    /// Сколько подходит по удобствам
    required int countByFacilities,

    /// Коллеция, в которой хранятся подсчеты
    /// по конкретынм значениям по удобствам
    required Map<Facility, int> countByFacilitiesMap,

    /// Сколько подходит по развлечениям
    required int countByFuns,

    /// Коллеция, в которой хранятся подсчеты
    /// по конкретынм значениям по развлечениям
    required Map<String, int> countByFunsMap,

    /// Минимальное значение остальны полей
    required int minCount,
  }) = _CountsEntity;

  /// Фабрика, при передачи в которую списка элементов
  /// и состояния фильтрров проводит расчеты
  factory CountsEntity.fromItemsAndFilters({
    required Set<ItemEntity> items,
    required FiltersEntity filtersState,
  }) {
    final countByDate = _countByDate(items, filtersState.dates);
    final countByPrice = _countByPrice(items, filtersState.priceFilter);
    final countByDistance =
        _countByDistance(items, filtersState.distanceFilter);
    final countByPlaceCount = _countByPlaceCount(
      items,
      filtersState.placeCountFilters,
    );
    final countByHouse = _countByHouse(items, filtersState.houseFilters);
    final countByHouseMap = _countByHouseMap(items, filtersState.houseFilters);
    final countByFacilities =
        _countByFacilities(items, filtersState.facilitiesFilters);
    final countByFacilitiesMap =
        _countByFacilitiesMap(items, filtersState.facilitiesFilters);
    final countByFuns = _countByFuns(items, filtersState.funsFilters);
    final countByFunsMap = _countByFunsMap(items, filtersState.funsFilters);
    final promMinCount = _countMin(
      countByDate: countByDate,
      countByPrice: countByPrice,
      countByDistance: countByDistance,
      countByPlaceCount: countByPlaceCount,
      countByHouse: countByHouse,
      countByFacilities: countByFacilities,
      countByFuns: countByFuns,
    );
    final minCount = promMinCount > 0 ? promMinCount : items.length;
    return CountsEntity(
      countByDate: countByDate,
      countByPrice: countByPrice,
      countByDistance: countByDistance,
      countByPlaceCount: countByPlaceCount,
      countByHouse: countByHouse,
      countByFacilities: countByFacilities,
      countByFuns: countByFuns,
      countByHouseMap: countByHouseMap,
      countByFacilitiesMap: countByFacilitiesMap,
      countByFunsMap: countByFunsMap,
      minCount: minCount,
    );
  }

  // factory CountsEntity.fromJson(Map<String, dynamic> json) =>
  //     _$CountsEntityFromJson(json);
}

int _countByDate(Set<ItemEntity> items, Set<DateTime>? dates) {
  if (dates == null) {
    return items.length;
  }
  return items
      .where((item) {
        return item.dates.first.isAfter(dates.first) &&
            (item.dates.last.isBefore(dates.last));
      })
      .toSet()
      .length;
}

int _countByPrice(Set<ItemEntity> items, PriceFilterEntity priceFilterState) {
  return items
      .where((item) {
        return priceFilterState.minPrice <= item.price &&
            item.price <= priceFilterState.maxPrice;
      })
      .toSet()
      .length;
}

int _countByDistance(Set<ItemEntity> items, int maxDistance) {
  final result = items
      .where((item) {
        return item.distance <= maxDistance;
      })
      .toSet()
      .length;
  return result;
}

int _countByPlaceCount(
  Set<ItemEntity> items,
  PlaceCountEntity placeFilterState,
) {
  return items
      .where((item) {
        return placeFilterState.minPlaces <= item.sleepPlacesCount &&
            item.sleepPlacesCount <= placeFilterState.maxPlaces &&
            placeFilterState.babyPlace <= item.babyPlaces;
      })
      .toSet()
      .length;
}

Map<HouseType, int> _countByHouseMap(
  Set<ItemEntity> items,
  Set<HouseType> houseTypeFilterState,
) {
  final map = <HouseType, int>{};
  for (final item in items) {
    map[item.type] = (map[item.type] ?? 0) + 1;
  }
  return map;
}

int _countByHouse(
  Set<ItemEntity> items,
  Set<HouseType> houseTypeFilterState,
) {
  if (houseTypeFilterState.isEmpty) {
    return items.length;
  } else {
    return items
        .where((item) => houseTypeFilterState.contains(item.type))
        .toSet()
        .length;
  }
}

Map<Facility, int> _countByFacilitiesMap(
  Set<ItemEntity> items,
  Set<Facility> facilitiesFilterState,
) {
  final map = <Facility, int>{};
  for (final item in items) {
    for (final facility in item.facilities) {
      map[facility] = (map[facility] ?? 0) + 1;
    }
  }
  return map;
}

int _countByFacilities(
  Set<ItemEntity> items,
  Set<Facility> facilitiesFilterState,
) {
  final facilities = items.map((item) => item.facilities).toSet();
  final resultSet = facilities.where((facilitiesSet) {
    final check = facilitiesFilterState.every(facilitiesSet.contains);
    return check;
  }).toSet();
  return resultSet.length;
}

Map<String, int> _countByFunsMap(
  Set<ItemEntity> items,
  Set<String> facilitiesFilterState,
) {
  final map = <String, int>{};
  for (final item in items) {
    for (final fun in item.funs) {
      map[fun] = (map[fun] ?? 0) + 1;
    }
  }
  return map;
}

int _countByFuns(
  Set<ItemEntity> items,
  Set<String> funsFilterState,
) {
  final funs = items.map((item) => item.funs).toSet();
  final resultSet = funs.where((funSet) {
    final check = funsFilterState.every(funSet.contains);
    return check;
  }).toSet();
  return resultSet.length;
}

int _countMin({
  required int countByDate,
  required int countByPrice,
  required int countByDistance,
  required int countByPlaceCount,
  required int countByHouse,
  required int countByFacilities,
  required int countByFuns,
}) {
  return [
    countByDate,
    countByPrice,
    countByDistance,
    countByPlaceCount,
    countByHouse,
    countByFacilities,
    countByFuns,
  ].reduce(min);
}
