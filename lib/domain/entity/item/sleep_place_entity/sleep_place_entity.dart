import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_place_entity.freezed.dart';
// part 'sleep_place_entity.g.dart';

/// Типа спального места
enum SleepPlace {
  /// Двуспальная кровать
  queenBed,

  /// диван
  sofa,

  /// Место для младенца
  babyPlace;

  /// Влзвращает [String] значение
  String stringValue() {
    switch (this) {
      case SleepPlace.queenBed:
        return 'queenBed';
      case SleepPlace.babyPlace:
        return 'babyPlace';
      case SleepPlace.sofa:
        return 'sofa';
    }
  }
}

@freezed

/// Модель спального мест
class SleepPlaceEntity with _$SleepPlaceEntity {
  /// Стандартный конструктор
  factory SleepPlaceEntity({
    /// Тип спального места
    required SleepPlace value,

    /// Кол-во мест
    required int count,
  }) = _SleepPlaceEntity;

  // factory SleepPlaceEntity.fromJson(Map<String, dynamic> json) =>
  //     _$SleepPlaceEntityFromJson(json);
}
