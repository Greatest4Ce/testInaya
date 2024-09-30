import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';

/// Кастомная тема для [TextButton]
class MyTextButtonTheme {
  /// Обязательный параметр [data] типа [TextButtonThemeData]
  const MyTextButtonTheme({
    required this.data,
  });

  /// СОздает светлую тему для [MyTextButtonTheme]
  factory MyTextButtonTheme.light() {
    final colorScheme = MyColorScheme.light();
    final textTheme = MyTextTheme.raw();
    final data = TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colorScheme.inactive),
        textStyle: WidgetStatePropertyAll(textTheme.p),
        overlayColor: WidgetStatePropertyAll(colorScheme.onSurface),
        alignment: Alignment.center,
      ),
    );
    return MyTextButtonTheme(data: data);
  }

  /// Поле типа [TextButtonThemeData]
  final TextButtonThemeData data;
}
