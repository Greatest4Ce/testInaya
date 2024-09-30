import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';

/// Кастомная тема для [FilledButton]
class MyFilledButtonTheme {
  /// Обязательный параметр [data] типа [FilledButtonTheme]
  const MyFilledButtonTheme({
    required this.data,
  });

  /// Создает светлую тему для [FilledButton]
  factory MyFilledButtonTheme.light() {
    final colorScheme = MyColorScheme.light();
    final textTheme = MyTextTheme.raw();

    final data = FilledButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        minimumSize: const WidgetStatePropertyAll(
          Size(149, 48),
        ),
        maximumSize: const WidgetStatePropertyAll(
          Size(double.maxFinite, 48),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 13, horizontal: 35),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.inactive;
          }
          return colorScheme.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.primary;
          }
          return colorScheme.surface;
        }),
        textStyle: WidgetStatePropertyAll(textTheme.p),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
    return MyFilledButtonTheme(
      data: data,
    );
  }

  /// Поле типа [FilledButtonThemeData]
  final FilledButtonThemeData data;
}
