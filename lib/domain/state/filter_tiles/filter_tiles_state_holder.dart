import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/entity/tiles_state_entity.dart/tiles_state_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';

/// Храналище состояние панелей групп фильтров
class FilterTilesStateHolder extends StateNotifier<TilesStateEntity> {
  /// Стандартный конструктор
  FilterTilesStateHolder(super._state);

  /// Изменение состояния панели группы фильтров
  void changeTileState({required FilterTile filterTile, required bool value}) {
    switch (filterTile) {
      case FilterTile.price:
        state = state.copyWith(priceExpanded: value);
      case FilterTile.distance:
        state = state.copyWith(distanceExpanded: value);
      case FilterTile.houseType:
        state = state.copyWith(houseTypeExpanded: value);
      case FilterTile.placesCount:
        state = state.copyWith(placesCountExpanded: value);
      case FilterTile.facilities:
        state = state.copyWith(facilitiesExpanded: value);
      case FilterTile.funs:
        state = state.copyWith(facilitiesExpanded: value);
    }
  }
}
