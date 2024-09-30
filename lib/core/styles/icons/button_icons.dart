import 'package:flutter/widgets.dart';

/// Класс, слдержащий иконки кнопок типа [IconData]
class ButtonIcons {
  ButtonIcons._();

  static const _kFontFam = 'ButtonIcons';

  /// Иконка календаря
  static const IconData calendar = IconData(0xe800, fontFamily: _kFontFam);

  /// Иконка фильтров
  static const IconData filters = IconData(0xe801, fontFamily: _kFontFam);

  /// Иконка залитого сердца
  static const IconData heartfilled = IconData(0xe802, fontFamily: _kFontFam);

  /// Иконка обведенного сердца
  static const IconData heartoutlined = IconData(0xe803, fontFamily: _kFontFam);

  /// Ионка карты
  static const IconData map = IconData(0xe804, fontFamily: _kFontFam);

  /// Иконка меню
  static const IconData menu = IconData(0xe805, fontFamily: _kFontFam);

  /// Иконка сообщения
  static const IconData message = IconData(0xe806, fontFamily: _kFontFam);

  /// Иконка телефона
  static const IconData phone = IconData(0xe807, fontFamily: _kFontFam);

  /// Иконка пути
  static const IconData route = IconData(0xe808, fontFamily: _kFontFam);

  /// Иконка лупы
  static const IconData search = IconData(0xe809, fontFamily: _kFontFam);

  /// Иконка поделиться
  static const IconData share = IconData(0xe80a, fontFamily: _kFontFam);
}
