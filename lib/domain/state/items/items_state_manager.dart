import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';

/// Провайдер, который вовзращает [ItemsStateManager]
final itemsStateManager = Provider<ItemsStateManager>((ref) {
  return ItemsStateManager(stateHolder: ref.watch(itemsStateHolder.notifier));
});

/// Менеджер состояния элементов
class ItemsStateManager {
  /// СТандартный конструктор
  ItemsStateManager({required ItemsStateHolder stateHolder})
      : _stateHolder = stateHolder;

  final ItemsStateHolder _stateHolder;

  /// Метод получения элементов
  void getItems() {
    _stateHolder.getItems();
  }
}
