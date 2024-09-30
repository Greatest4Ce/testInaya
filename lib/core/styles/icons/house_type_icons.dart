import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// Класс, содержащий иконки Типов домов
/// Возвращаемый тип - [SvgPicture]
class HouseTypeIcons {
  /// Иконка a-Frame
  static SvgPicture get aFrame => SvgPicture.asset(
        'assets/icons/house_types/aFrame.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка барнхауйса
  static SvgPicture get barnHouse => SvgPicture.asset(
        'assets/icons/house_types/barnHouse.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка дома бочки
  static SvgPicture get barrelHouse => SvgPicture.asset(
        'assets/icons/house_types/barrelHouse.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка модульного дома
  static SvgPicture get modulHouse => SvgPicture.asset(
        'assets/icons/house_types/modulHouse.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка базы отдыха
  static SvgPicture get recreationCenter => SvgPicture.asset(
        'assets/icons/house_types/recreationCenter.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка сафари
  static SvgPicture get safari => SvgPicture.asset(
        'assets/icons/house_types/safari.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка шале
  static SvgPicture get shale => SvgPicture.asset(
        'assets/icons/house_types/shale.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка сферы
  static SvgPicture get sphere => SvgPicture.asset(
        'assets/icons/house_types/sphere.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );
}
