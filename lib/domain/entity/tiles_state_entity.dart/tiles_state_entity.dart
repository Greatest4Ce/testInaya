import 'package:freezed_annotation/freezed_annotation.dart';

part 'tiles_state_entity.freezed.dart';
// part 'tiles_state_entity.g.dart';

@freezed

/// Модель состояний групп фильтров
class TilesStateEntity with _$TilesStateEntity {
  /// Стадартный конструктор
  const factory TilesStateEntity({
    /// Раскрыта/закрыта группа "По цене"
    @Default(false) bool priceExpanded,

    /// Раскрыта/закрыта группа "ПО отдаленности"
    @Default(false) bool distanceExpanded,

    /// Раскрыта/закрыта группа "По типу дома"
    @Default(false) bool houseTypeExpanded,

    /// Раскрыта/закрыта группа "Количество мест"
    @Default(false) bool placesCountExpanded,

    /// Раскрыта/закрыта группа "Удобства"
    @Default(false) bool facilitiesExpanded,

    /// Раскрыта/закрыта группа "Развлечения"
    @Default(false) bool funsExpanded,
  }) = _TilesStateEntity;

  // factory TilesStateEntity.fromJson(Map<String, dynamic> json) =>
  //     _$TilesStateEntityFromJson(json);
}
