import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testinaya/domain/entity/counts_entity/counts_entity.dart';
import 'package:testinaya/domain/entity/filters_state/filter_state/filters_state.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/entity/tiles_state_entity.dart/tiles_state_entity.dart';
import 'package:testinaya/domain/state/filter/filter_state_manager.dart';
import 'package:testinaya/domain/state/filter_tiles/filter_tiles_state_manager.dart';
import 'package:testinaya/presentation/widgets/filter/filters_list.dart';

part 'filter_page_entity.freezed.dart';
// part 'filter_page_entity.g.dart';

/// Модель состояния [FiltersList]
@freezed
class FilterPageEntity with _$FilterPageEntity {
  /// Стандартный конструктор
  factory FilterPageEntity({
    /// Состояние фильтров
    required FiltersEntity filters,

    /// Список всех элементов
    required Set<ItemEntity> items,

    /// Состояние подсчета по группам
    required CountsEntity counts,

    /// Менджер для управления состоянием фильтров
    required FilterStateManager filtersManager,

    /// Состояние открытости/закрытости групп филтров
    required TilesStateEntity filterTilesState,

    /// Менеджер для управления состоянием групп фильтров
    required FilterTilesStateManager filterTilesManager,

    /// Отфилтрованный список элементов
    @Default({}) Set<ItemEntity> filteredList,
  }) = _FilterPageEntity;

  // factory FilterPageEntity.fromJson(Map<String, dynamic> json) =>
  //     _$FilterPageEntityFromJson(json);
}
