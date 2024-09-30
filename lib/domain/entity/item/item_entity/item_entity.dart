import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testinaya/domain/entity/item/sleep_place_entity/sleep_place_entity.dart';

part 'item_entity.freezed.dart';
// part 'item_entity.g.dart';

/// Тип дома
enum HouseType {
  /// А-frame
  aFrame,

  /// Сафари
  safari,

  /// База отдыха
  recreationCenter,

  /// Барнхаус
  barnouse,

  /// Сфера
  sphere,

  /// Модульный дом
  modulHouse,

  /// Шале
  shale,

  /// Дом бочка
  barrelHouse;

  /// Возварщает [String] значение
  String stringValue() {
    switch (this) {
      case HouseType.aFrame:
        return 'aFrame';
      case HouseType.safari:
        return 'safari';
      case HouseType.recreationCenter:
        return 'recreationCenter';
      case HouseType.barnouse:
        return 'barnhouse';
      case HouseType.sphere:
        return 'sphere';
      case HouseType.modulHouse:
        return 'modulHouse';
      case HouseType.shale:
        return 'shale';
      case HouseType.barrelHouse:
        return 'barrelHouse';
    }
  }

  @override
  String toString() {
    switch (this) {
      case HouseType.aFrame:
        return 'aFrame';
      case HouseType.safari:
        return 'safari';
      case HouseType.recreationCenter:
        return 'recreationCenter';
      case HouseType.barnouse:
        return 'barnhouse';
      case HouseType.sphere:
        return 'sphere';
      case HouseType.modulHouse:
        return 'modulHouse';
      case HouseType.shale:
        return 'shale';
      case HouseType.barrelHouse:
        return 'barrelHouse';
    }
  }
}

/// Удобства
enum Facility {
  /// Мангал
  mangal,

  /// Паркинг
  parking,

  /// ТВ
  tv,

  /// Кондиционер
  conditioner,

  /// Кухня
  kitchen,

  /// Wifi
  wifi,

  /// Беседка
  talkingHouse;

  /// Возваращает [String] значение
  String stringValue() {
    switch (this) {
      case Facility.mangal:
        return 'mangal';
      case Facility.parking:
        return 'parking';
      case Facility.tv:
        return 'tv';
      case Facility.conditioner:
        return 'conditioner';
      case Facility.kitchen:
        return 'kitchen';
      case Facility.wifi:
        return 'wifi';
      case Facility.talkingHouse:
        return 'talkingHouse';
    }
  }

  @override
  String toString() {
    switch (this) {
      case Facility.mangal:
        return 'mangal';
      case Facility.parking:
        return 'parking';
      case Facility.tv:
        return 'tv';
      case Facility.conditioner:
        return 'conditioner';
      case Facility.kitchen:
        return 'kitchen';
      case Facility.wifi:
        return 'wifi';
      case Facility.talkingHouse:
        return 'talkingHouse';
    }
  }
}

/// Развлечения
enum Fun {
  /// Водоем
  lake,

  /// Джакузи
  jakuzi,

  /// Бильярд
  billiard,

  /// Фурако
  furako,

  /// Бассейн
  pool,

  /// Сапборд
  supboard,

  /// Конный прогулки
  horseSport,

  /// Велоспиеды
  bicycle;
}

@freezed

/// Модель элемента
class ItemEntity with _$ItemEntity {
  /// Стандартный конструктор
  factory ItemEntity({
    /// Тип дома
    required HouseType type,

    /// Название
    required String title,

    /// Текст описания
    required String body,

    /// Даты от и до
    required Set<DateTime> dates,

    /// Пути до прикрепленных фото
    required Set<String> imagePaths,

    /// Минимальное кол-во гостей
    required int minGuests,

    /// Максимальное кол-во гостей
    required int maxGuests,

    /// Кол-во просмотров
    required int views,

    /// Цена
    required int price,

    /// Адрес
    required String address,

    /// Отдаленность
    required int distance,

    /// Номер телефона
    required int phonNumber,

    /// Развлечени
    required Set<String> funs,

    /// Удобства
    required Set<Facility> facilities,

    /// Суммарное кол-во спальных мест
    required int sleepPlacesCount,

    /// Кол-во спальных мест по группам
    required Set<SleepPlaceEntity> sleepPlaces,

    /// Кол-во мест для младенцев
    required int babyPlaces,

    /// Идентификтор
    required String id,

    /// Нравится ли
    @Default(false) bool liked,
  }) = _ItemEntity;

  // factory ItemEntity.fromJson(Map<String, dynamic> json) =>
  //     _$ItemEntityFromJson(json);
}
