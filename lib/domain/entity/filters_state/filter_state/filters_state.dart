import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testinaya/domain/entity/filters_state/place_count_filter/place_count.dart';
import 'package:testinaya/domain/entity/filters_state/price_filter/price_filter.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';

part 'filters_state.freezed.dart';
// part 'filters_state.g.dart';

/// Модель состояния фильтров
@freezed
class FiltersEntity with _$FiltersEntity {
  /// Стандартный конструктор
  const factory FiltersEntity({
    /// Фильтр цены
    required PriceFilterEntity priceFilter,

    /// Фильтр отдаленности
    required int distanceFilter,

    /// Фильтр спальных мест
    required PlaceCountEntity placeCountFilters,

    /// Фильтр дат
    Set<DateTime>? dates,
    @Default({}) Set<HouseType> houseFilters,

    /// Фильтр удобств
    @Default({}) Set<Facility> facilitiesFilters,
    // Фильтр развлечений
    @Default({}) Set<String> funsFilters,
  }) = _FiltersEntity;

  /// Создает [FiltersEntity] со значениями по-умолчанию
  factory FiltersEntity.raw({required Set<ItemEntity> items}) {
    var minPrice = items.first.price;
    var maxPrice = 0;
    var maxDistance = items.first.distance;
    var minPlaces = items.first.sleepPlacesCount;
    var maxPlace = 0;
    const babyPlace = 0;
    for (final item in items) {
      if (minPrice >= item.price) {
        minPrice = item.price;
      }
      if (maxPrice <= item.price) {
        maxPrice = item.price;
      }
      if (maxDistance <= item.distance) {
        maxDistance = item.distance;
      }
      if (minPlaces >= item.sleepPlacesCount) {
        minPlaces = item.sleepPlacesCount;
      }
      if (maxPlace <= item.sleepPlacesCount) {
        maxPlace = item.sleepPlacesCount;
      }
    }
    return FiltersEntity(
      priceFilter: PriceFilterEntity(
        minPrice: minPrice,
        maxPrice: maxPrice,
      ),
      distanceFilter: maxDistance,
      placeCountFilters: PlaceCountEntity(
        minPlaces: minPlaces,
        maxPlaces: maxPlace,
        babyPlace: babyPlace,
      ),
    );
  }

  // factory FiltersEntity.fromJson(Map<String, dynamic> json) =>
  //     _$FiltersEntityFromJson(json);
}
