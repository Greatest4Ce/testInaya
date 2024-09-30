import 'package:flutter/material.dart';

/// Цветовая схема приложения
class MyColorScheme extends ThemeExtension<MyColorScheme> {
  /// Базовый конструктор приложения
  const MyColorScheme({
    required this.surface,
    required this.onSurface,
    required this.primary,
    required this.inactive,
  });

  /// Создает светлую цветовую схему приложения
  factory MyColorScheme.light() {
    return const MyColorScheme(
      surface: Color(0xffffffff),
      onSurface: Color(0xffF3F3F3),
      primary: Color(0xff181818),
      inactive: Color(0xff8C8C8C),
    );
  }

  /// [surface] - цвет фоновых поверхностей
  final Color surface;

  /// [onSurface] - цвет для выделения обьектов на фоне
  final Color onSurface;

  /// [primary] - акцентный цвет приложения
  final Color primary;

  /// [inactive] - цвет неактивных элементов интерфейса
  final Color inactive;

  @override
  ThemeExtension<MyColorScheme> copyWith({
    Color? surface,
    Color? onSurface,
    Color? primary,
    Color? inactive,
  }) {
    return MyColorScheme(
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      primary: primary ?? this.primary,
      inactive: inactive ?? this.inactive,
    );
  }

  @override
  ThemeExtension<MyColorScheme> lerp(
    covariant ThemeExtension<MyColorScheme>? other,
    double t,
  ) {
    if (other is! MyColorScheme) {
      return this;
    }
    return MyColorScheme(
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
    );
  }
}

/// extension для использования кастомной цветовой палитры через context
extension MyColorChemeExtension on BuildContext {
  /// Позволяет получить активную цветовую палитру через context.[myColorScheme]
  MyColorScheme get myColorScheme => Theme.of(this).extension<MyColorScheme>()!;
}
