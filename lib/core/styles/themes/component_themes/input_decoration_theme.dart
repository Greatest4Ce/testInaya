import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';

/// Кастомная тема для элементов использующих [InputDecoration]
class MyInputDecorationTheme {
  /// Обязательные параметры:
  /// [colorScheme] типа [MyColorScheme]
  /// [theme] типа [InputDecorationTheme]
  const MyInputDecorationTheme({
    required this.colorScheme,
    required this.theme,
  });

  /// СОздает светлую тему [MyInputDecorationTheme]
  factory MyInputDecorationTheme.light() {
    final colorScheme = MyColorScheme.light();
    final textTheme = MyTextTheme.raw();
    final theme = InputDecorationTheme(
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.inactive,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      prefixIconColor: colorScheme.primary,
      suffixIconColor: colorScheme.primary,
      hintStyle: textTheme.p?.copyWith(
        color: colorScheme.inactive,
      ),
      constraints: const BoxConstraints(
        maxHeight: 48,
      ),
    );
    return MyInputDecorationTheme(
      colorScheme: colorScheme,
      theme: theme,
    );
  }

  /// Поле типа [MyColorScheme]
  final MyColorScheme colorScheme;

  /// Поле типа [InputDecorationTheme]
  final InputDecorationTheme theme;
}
