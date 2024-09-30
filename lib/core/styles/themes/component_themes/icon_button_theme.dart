import 'package:flutter/material.dart';

/// Кастомная тема для [IconButton]
class MyIconButtonTheme {
  /// Обязательный параметр [data] типа [IconButtonThemeData]
  const MyIconButtonTheme({
    required this.data,
  });

  /// СОздает светлую тему для [MyIconButtonTheme]
  factory MyIconButtonTheme.light() {
    // final colorScheme = MyColorScheme.light();
    const data = IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(24),
        padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
      ),
    );
    return const MyIconButtonTheme(data: data);
  }

  /// Поле типа [IconButtonThemeData]
  final IconButtonThemeData data;
}
