import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_count.freezed.dart';
// part 'place_count.g.dart';

@freezed

/// Модель состояния фильтра спальных мест
class PlaceCountEntity with _$PlaceCountEntity {
  /// Стандартный конструктор
  const factory PlaceCountEntity({
    /// Минимальное кол-во мест
    required int minPlaces,

    /// Максимальное кол-во мест
    required int maxPlaces,

    /// Кол-во мест для младенцев
    required int babyPlace,
  }) = _PlaceCountEntity;

  // factory PlaceCountState.fromJson(Map<String, dynamic> json) =>
  //     _$PlaceCountStateFromJson(json);
}
