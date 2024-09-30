import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/entity/filters_state/filter_state/filters_state.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';

/// Хранилище состояния фильтров
class FilterStateHolder extends StateNotifier<FiltersEntity> {
  /// СТандартный конструктор
  FilterStateHolder(super._state);

  /// Изменение значения конкретного фильтра
  /// [filterType] типа [FilterCategory] - к какой категории относится фильтр
  /// [value] типа [Object] - значение для изменения/ддобавления/удаления
  /// [add] типа [bool] - (значение по умолчанию false), если категория
  ///  представляет собой список, необходимо передать и отвечает по таблице
  ///  ______________________
  ///  | add    |  действие |
  ///  |--------+-----------|
  ///  | true   |  добавить |
  ///  |--------+-----------|
  ///  | false  |  удалить  |
  ///  |________|___________|
  void changeFilterValue({
    required FilterCategory filterType,
    required Object value,
    bool? add,
  }) {
    assert(
      {
        FilterCategory.houseType,
        FilterCategory.facilities,
        FilterCategory.funs,
        FilterCategory.babyPlace,
      }.contains(filterType)
          ? add != null
          : add == null,
      '''if FilterCategory  == (.houseType || .facilities || .funs) add must be !=null''',
    );
    switch (filterType) {
      case FilterCategory.date:
        _changeDates(value: value as Set<DateTime>);
      case FilterCategory.minPrice:
        _changeMinPrice(value: value as int);
      case FilterCategory.maxPrice:
        _changeMaxPrice(value: value as int);
      case FilterCategory.distance:
        _changeDistance(value: value as int);
      case FilterCategory.houseType:
        _changeHouseFilters(value: value as HouseType, add: add!);
      case FilterCategory.minPlacesCount:
        _changeMinPlaceCount(value: value as int);
      case FilterCategory.maxPlacesCount:
        _changeMaxPlaceCount(value: value as int);
      case FilterCategory.babyPlace:
        _changeBabyPlaceCount(add: add!);
      case FilterCategory.facilities:
        _changeFacilitiesFilters(value: value as Facility, add: add!);
      case FilterCategory.funs:
        _changeFunsFilter(value: value as String, add: add!);
    }
  }

  /// Метод очищающий фильтры
  void clearFilter({required Set<ItemEntity> items}) {
    final rawState = FiltersEntity.raw(items: items);
    state = state.copyWith(
      priceFilter: rawState.priceFilter,
      distanceFilter: rawState.distanceFilter,
      placeCountFilters: rawState.placeCountFilters,
      dates: rawState.dates,
      houseFilters: rawState.houseFilters,
      facilitiesFilters: rawState.facilitiesFilters,
      funsFilters: rawState.funsFilters,
    );
  }

  void _changeDates({required Set<DateTime> value}) {
    state = state.copyWith(dates: value);
  }

  void _changeMinPrice({required int value}) {
    state = state.copyWith(
      priceFilter: state.priceFilter.copyWith(minPrice: value),
    );
  }

  void _changeMaxPrice({required int value}) {
    state = state.copyWith(
      priceFilter: state.priceFilter.copyWith(maxPrice: value),
    );
  }

  void _changeDistance({required int value}) {
    state = state.copyWith(distanceFilter: value);
  }

  void _changeHouseFilters({required HouseType value, required bool add}) {
    final set = {...state.houseFilters};
    if (add) {
      set.add(value);
    } else {
      set.remove(value);
    }
    state = state.copyWith(houseFilters: set);
  }

  /// Метод, который сбрасывает фильтр "По типу дома"
  void resetHouseFilters() {
    state = state.copyWith(houseFilters: {});
  }

  void _changeMinPlaceCount({required int value}) {
    state = state.copyWith(
      placeCountFilters: state.placeCountFilters.copyWith(minPlaces: value),
    );
  }

  void _changeMaxPlaceCount({required int value}) {
    state = state.copyWith(
      placeCountFilters: state.placeCountFilters.copyWith(maxPlaces: value),
    );
  }

  void _changeBabyPlaceCount({
    required bool add,
  }) {
    if (add) {
      if (state.placeCountFilters.babyPlace < 99) {
        state = state.copyWith(
          placeCountFilters: state.placeCountFilters
              .copyWith(babyPlace: state.placeCountFilters.babyPlace + 1),
        );
      }
    } else {
      if (state.placeCountFilters.babyPlace > 0) {
        state = state.copyWith(
          placeCountFilters: state.placeCountFilters
              .copyWith(babyPlace: state.placeCountFilters.babyPlace - 1),
        );
      }
    }
  }

  void _changeFacilitiesFilters({required Facility value, required bool add}) {
    final set = {...state.facilitiesFilters};
    if (add) {
      set.add(value);
    } else {
      set.remove(value);
    }
    state = state.copyWith(facilitiesFilters: set);
  }

  void _changeFunsFilter({required String value, required bool add}) {
    final set = {...state.funsFilters};
    if (add) {
      set.add(value);
    } else {
      set.remove(value);
    }
    state = state.copyWith(funsFilters: set);
  }
}
