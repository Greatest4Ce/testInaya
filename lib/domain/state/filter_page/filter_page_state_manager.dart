import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';

/// Провайдер позвращающий [FilterPageStateManager]
final filterPageStateManager = Provider<FilterPageStateManager>((ref) {
  return FilterPageStateManager(
    stateHolder: ref.watch(filterPageStateHolder.notifier),
  );
});

/// Менеджер состояния страницы фильтров
class FilterPageStateManager {
  /// Стандартный конструкто
  FilterPageStateManager({required FilterPageStateHolder stateHolder})
      : _stateHolder = stateHolder;

  final FilterPageStateHolder _stateHolder;

  /// Метод вызывающий фильтрацию
  void filter() {
    _stateHolder.filter();
  }

  /// Изменение значения фильтра
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
    _stateHolder.changeFilterValue(
      filterType: filterType,
      value: value,
      add: add,
    );
  }

  /// Очистка фильтров
  void clearFilters() {
    _stateHolder.clearFilters();
  }

  /// Очистка отфильтрованного списка
  void clearFilteredList() {
    _stateHolder.clearFilteredList();
  }

  /// Отчистка фильтра "По типу дома"
  void clearHouseTypeFilters() {
    _stateHolder.resetHouseFilters();
  }

  /// Изменения состояния панели группы фильтров
  void changeTileState({
    required FilterTile filterTile,
    required bool value,
  }) {
    _stateHolder.changeTileState(filterTile: filterTile, value: value);
  }
}
