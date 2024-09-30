import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

/// Класс, содержащий иконки спальных мест
/// Возвращаемый тип - [SvgPicture]
class SleepPlaceIcons {
  /// Иконка места для младенца
  static SvgPicture get babyPlace => SvgPicture.asset(
        'assets/icons/sleep_places/babyPlace.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка двухспальной кровати
  static SvgPicture get queenBed => SvgPicture.asset(
        'assets/icons/sleep_places/queenBed.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );

  /// Иконка дивана
  static SvgPicture get sofa => SvgPicture.asset(
        'assets/icons/sleep_places/sofa.svg',
        height: 40,
        width: 40,
        fit: BoxFit.scaleDown,
      );
}
