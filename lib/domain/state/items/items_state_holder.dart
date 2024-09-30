import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/entity/item/sleep_place_entity/sleep_place_entity.dart';
import 'package:uuid/uuid.dart';

/// Провайдер, который возвращает [ItemsStateHolder]
final itemsStateHolder =
    StateNotifierProvider<ItemsStateHolder, Set<ItemEntity>>((ref) {
  return ItemsStateHolder(_itemsMock);
});

/// Хранилище состояний элементов
class ItemsStateHolder extends StateNotifier<Set<ItemEntity>> {
  /// СТандартный конструктор
  ItemsStateHolder(super._state);

  /// Метод получения элементов
  void getItems() {
    // TODO(Someone): implement getItems
  }
}

final _itemsMock = List.generate(100, (index) {
  return ItemEntity(
    id: const Uuid().v4(),
    type: HouseType.values[Random().nextInt(HouseType.values.length - 1)],
    title: _titles[Random().nextInt(3)],
    body: '''
Единственный эко-отель в Башкирии и на всём Южном Урале, где можно пожить в настоящих башкирских юртах!

Мы ждем вас в гости с семьей или друзьями! Юрты, как и в древние времена, изготовлены из войлока и дерева, а для более комфортного проживания оборудованы печью-камином и электричеством. Они расположены на живописном берегу Нугушского водохранилища, вдали от повседневных забот, городского шума и суеты. Опыт проживания в юртах - это идеальный способ погрузиться за короткий срок в быт и культуру местного кочевого этноса - башкир.
''',
    dates: {
      DateTime(2024, 10, Random().nextInt(10)),
      DateTime(2024, 10, Random().nextInt(15) + 11),
    },
    imagePaths: _imagePaths
        .sublist(
          Random().nextInt(_imagePaths.length - 1),
          _imagePaths.length - 1,
        )
        .toSet(),
    minGuests: Random().nextInt(10) + 1,
    maxGuests: Random().nextInt(11) + 10,
    views: 430,
    price: Random().nextInt(50000) + 5000,
    address: 'Республика Башкортостан, Мелеузовский район, д. Сергеевка',
    distance: Random().nextInt(1000),
    phonNumber: 89112223344,
    funs: _funs
        .sublist(
          Random().nextInt(_funs.length),
          _funs.length,
        )
        .toSet(),
    facilities: Facility.values
        .sublist(
          Random().nextInt(Facility.values.length),
          Facility.values.length,
        )
        .toSet(),
    sleepPlaces: {
      SleepPlaceEntity(
        value: SleepPlace.queenBed,
        count: Random().nextInt(3),
      ),
      SleepPlaceEntity(
        value: SleepPlace.sofa,
        count: Random().nextInt(3),
      ),
      SleepPlaceEntity(
        value: SleepPlace.babyPlace,
        count: Random().nextInt(3),
      ),
    }.toSet(),
    babyPlaces: Random().nextInt(4),
    sleepPlacesCount: Random().nextInt(10) + 1,
  );
}).toSet();

const _imagePaths = [
  'assets/images/avatars/avatar1.png',
  'assets/images/avatars/avatar2.png',
  'assets/images/avatars/avatar1.png',
  'assets/images/avatars/avatar2.png',
  'assets/images/avatars/avatar1.png',
  'assets/images/avatars/avatar2.png',
  'assets/images/avatars/avatar1.png',
  'assets/images/avatars/avatar2.png',
  'assets/images/avatars/avatar1.png',
];

const _funs = [
  'bicycles',
  'billiard',
  'furako',
  'horseSport',
  'jakuzi',
  'lake',
  'pool',
  'supboard',
];

const _titles = [
  'Глэмпинг Караидель',
  'Этнопарк INAYA',
  'Прогулка Белая',
];
