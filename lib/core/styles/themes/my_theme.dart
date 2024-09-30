import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/themes/component_themes/date_picker_theme.dart';
import 'package:testinaya/core/styles/themes/component_themes/filled_button_theme.dart';
import 'package:testinaya/core/styles/themes/component_themes/icon_button_theme.dart';
import 'package:testinaya/core/styles/themes/component_themes/input_decoration_theme.dart';
import 'package:testinaya/core/styles/themes/component_themes/text_button_theme.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';

/// Кастомная тема
class MyTheme {
  /// Обазтельный параметры:
  /// [colorScheme] типа [MyColorScheme]
  const MyTheme({
    required this.colorScheme,
    required this.data,
  });

  /// СОздает светлую [MyTheme]
  factory MyTheme.light() {
    final colorScheme = MyColorScheme.light();
    final data = ThemeData(
      extensions: [
        MyTextTheme.raw(),
        MyColorScheme.light(),
      ],
      scaffoldBackgroundColor: colorScheme.surface,
      filledButtonTheme: MyFilledButtonTheme.light().data,
      textButtonTheme: MyTextButtonTheme.light().data,
      iconButtonTheme: MyIconButtonTheme.light().data,
      inputDecorationTheme: MyInputDecorationTheme.light().theme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: colorScheme.surface,
        dragHandleSize: const Size(200, 4),
      ),
      datePickerTheme: MyDatePickerTheme.light().data,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
      ),
    );
    return MyTheme(
      colorScheme: colorScheme,
      data: data,
    );
  }

  /// Поле типа [MyColorScheme]
  final MyColorScheme colorScheme;

  /// Поле типа [ThemeData]
  final ThemeData data;
}
