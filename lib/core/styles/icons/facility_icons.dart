import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// Класс, содержащий иконки удобств
/// возвращаемый тип - [SvgPicture]
class FacilityIcons {
  /// Иконка кондиционера
  static SvgPicture get conditioner => SvgPicture.asset(
        'assets/icons/facilities/conditioner.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка  кухни
  static SvgPicture get kitchen => SvgPicture.asset(
        'assets/icons/facilities/kitchen.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка мангала
  static SvgPicture get mangal => SvgPicture.asset(
        'assets/icons/facilities/mangal.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка парковки
  static SvgPicture get parking => SvgPicture.asset(
        'assets/icons/facilities/parking.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка беседки
  static SvgPicture get talkingHouse => SvgPicture.asset(
        'assets/icons/facilities/talkingHouse.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка ТВ
  static SvgPicture get tv => SvgPicture.asset(
        'assets/icons/facilities/tv.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка WiFi
  static SvgPicture get wifi => SvgPicture.asset(
        'assets/icons/facilities/wifi.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );
}
