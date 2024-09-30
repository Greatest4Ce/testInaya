import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';

/// Кастоманя тема [DatePickerTheme]
class MyDatePickerTheme {
  /// Обязательный параметр [data] типа [DatePickerThemeData]
  MyDatePickerTheme({
    required this.data,
  });

  /// Создает светулую [MyDatePickerTheme]
  factory MyDatePickerTheme.light() {
    final colorScheme = MyColorScheme.light();
    final data = DatePickerThemeData(
      backgroundColor: colorScheme.surface,
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surface;
      }),
      rangeSelectionBackgroundColor: colorScheme.onSurface,
    );
    return MyDatePickerTheme(data: data);
  }

  /// Поле типа [DatePickerTheme]
  final DatePickerThemeData data;
}
