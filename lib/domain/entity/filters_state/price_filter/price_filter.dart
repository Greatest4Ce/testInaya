import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_filter.freezed.dart';
// part 'price_filter.g.dart';

@freezed

/// Модель состояния фильтра по цене
class PriceFilterEntity with _$PriceFilterEntity {
  /// Стандартный конструктор
  const factory PriceFilterEntity({
    /// Минимальная цена
    required int minPrice,

    /// Максимальная цена
    required int maxPrice,
  }) = _PriceFilterEntity;

  // factory PriceFilterEntity.fromJson(Map<String, dynamic> json) =>
  //     _$PriceFilterEntityFromJson(json);
}
