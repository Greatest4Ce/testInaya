import 'package:flutter/material.dart';

/// Кастомная текстовая тема
class MyTextTheme extends ThemeExtension<MyTextTheme> {
  /// Конструктоор
  const MyTextTheme({
    required this.button,
    required this.little,
    required this.p,
    required this.h3,
    required this.h2,
    required this.label,
    required this.littleAddress,
  });

  /// Создает [MyTextTheme] со значениями по-умолчанию
  factory MyTextTheme.raw() {
    return const MyTextTheme(
      button: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 16,
        height: 22 / 16,
        fontWeight: FontWeight.w500,
      ),
      little: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14,
        height: 20 / 18,
        fontWeight: FontWeight.w400,
      ),
      p: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 15,
        height: 22 / 15,
        fontWeight: FontWeight.w400,
      ),
      h3: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
      ),
      h2: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 20,
        height: 26 / 20,
        fontWeight: FontWeight.w600,
      ),
      label: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w400,
      ),
      littleAddress: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// Кнопки
  final TextStyle? button;

  /// Мелкие заметки
  final TextStyle? little;

  /// Оснвной текст
  final TextStyle? p;

  /// Больщой заголовок
  final TextStyle? h3;

  /// Средний заголовок
  final TextStyle? h2;

  /// леблый элементов
  final TextStyle? label;

  /// Для адресов
  final TextStyle? littleAddress;

  @override
  ThemeExtension<MyTextTheme> copyWith({
    TextStyle? button,
    TextStyle? little,
    TextStyle? p,
    TextStyle? h3,
    TextStyle? h2,
    TextStyle? label,
    TextStyle? littleAddress,
  }) {
    return MyTextTheme(
      button: button ?? this.button,
      little: little ?? this.little,
      p: p ?? this.p,
      h3: h3 ?? this.h3,
      h2: h2 ?? this.h2,
      label: label ?? this.label,
      littleAddress: littleAddress ?? this.littleAddress,
    );
  }

  @override
  ThemeExtension<MyTextTheme> lerp(
    covariant ThemeExtension<MyTextTheme>? other,
    double t,
  ) {
    if (other is! MyTextTheme) {
      return this;
    }
    return MyTextTheme(
      button: TextStyle.lerp(button, other.button, t),
      little: TextStyle.lerp(little, other.little, t),
      p: TextStyle.lerp(p, other.p, t),
      h3: TextStyle.lerp(h3, other.h3, t),
      h2: TextStyle.lerp(h2, other.h2, t),
      label: TextStyle.lerp(label, other.label, t),
      littleAddress: TextStyle.lerp(littleAddress, other.littleAddress, t),
    );
  }
}

/// Расширения для получения [MyTextTheme]
extension MyTextThemeExtension on BuildContext {
  /// getter для того, чтобы поулчать [MyTextTheme] через context.[textTheme]
  MyTextTheme get textTheme => Theme.of(this).extension<MyTextTheme>()!;
}
