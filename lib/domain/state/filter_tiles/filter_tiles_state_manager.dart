import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_tiles/filter_tiles_state_holder.dart';

/// Менеджер состояний гурпп фильтров
class FilterTilesStateManager {
  /// Стандартный конструктор
  FilterTilesStateManager({required FilterTilesStateHolder stateHolder})
      : _stateHolder = stateHolder;

  final FilterTilesStateHolder _stateHolder;

  /// Изменение состояния конкретной группы фильтров
  void changeTileState({
    required FilterTile filterTile,
    required bool value,
  }) {
    _stateHolder.changeTileState(
      filterTile: filterTile,
      value: value,
    );
  }
}
