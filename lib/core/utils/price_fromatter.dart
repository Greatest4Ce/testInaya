import 'dart:ui';

import 'package:intl/intl.dart';

/// Метод форматирующи [num] значение в цену типа [String]
String formatPrice(num price, Locale locale) {
  return NumberFormat.simpleCurrency(
    locale: locale.languageCode,
    decimalDigits: 0,
  ).format(price);
}
