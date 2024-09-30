import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter/filter_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';

/// Менеджер состояния фильтров
class FilterStateManager {
  /// Стандартный конструктор
  FilterStateManager({required FilterStateHolder stateHolder})
      : _stateHolder = stateHolder;

  final FilterStateHolder _stateHolder;

  /// Сброс фильтра "По типу дома"
  void resetHouseTypeFilters() {
    _stateHolder.resetHouseFilters();
  }

  /// Очитка фильтров
  void clearFilters({required Set<ItemEntity> items}) {
    _stateHolder.clearFilter(items: items);
  }

  /// Изменение значения конкретного фильтра
  void changeFilterValue({
    required FilterCategory filterType,
    required Object value,
    bool? add,
  }) {
    _stateHolder.changeFilterValue(
      filterType: filterType,
      value: value,
      add: add,
    );
  }
}
