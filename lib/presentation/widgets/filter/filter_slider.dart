import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/presentation/widgets/filter/filter_chart.dart';
import 'package:testinaya/presentation/widgets/filter/slider_button.dart';

/// Виджет, который строить слайдер для фильтров
class FilterSlider extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [leftValue] - значение для левого слайдера
  /// [List]<[Widget]>[buttons] - слайдеры, максимум 2
  /// [width] - ширина слайдер
  /// [withChart] - с/без графиком(-а)
  /// [rightValue] - значение для левого слайдера
  /// [onFirstUpdate] - действие на движение первого слайдера
  /// [onSecondUpdate] - дейсвтие на движение правого слайдер
  /// [chartValue] - значения для графика
  const FilterSlider({
    required this.leftValue,
    required this.buttons,
    required this.width,
    this.withChart = false,
    this.rightValue,
    super.key,
    this.onFirstUpdate,
    this.onSecondUpdate,
    this.chartValue,
  }) : assert(buttons.length <= 2, 'Маскимальное количество кнопок -2 ');

  /// Строит слайдер с одной кнопки
  factory FilterSlider.oneValue({
    required double width,
    required void Function(int) onUpdate,
    required int leftValue,
    required int maxValue,
    required int minValue,
    bool? withChart = false,
    List<int>? chartValues,
  }) {
    return FilterSlider(
      width: width,
      leftValue: leftValue,
      onFirstUpdate: onUpdate,
      withChart: withChart,
      chartValue: chartValues,
      buttons: [
        SliderButton.outlined(
          width: width,
          value: leftValue,
          maxValue: maxValue,
          onUpdate: onUpdate,
          minValue: minValue,
        ),
      ],
    );
  }

  /// Строит слайдер с двумя кнопками
  factory FilterSlider.twoValue({
    required double width,
    required int leftValue,
    required int rightValue,
    required int minValue,
    required int maxValue,
    required void Function(int)? onFirstUpdate,
    required void Function(int)? onSecondUpdate,
    bool? withChart = false,
    List<int>? chartValues,
  }) {
    return FilterSlider(
      width: width,
      leftValue: leftValue,
      rightValue: rightValue,
      onFirstUpdate: onFirstUpdate,
      onSecondUpdate: onSecondUpdate,
      withChart: withChart,
      chartValue: chartValues,
      buttons: [
        SliderButton.outlined(
          width: width,
          value: leftValue,
          minValue: minValue,
          maxValue: rightValue,
          onUpdate: onFirstUpdate,
        ),
        SliderButton.filled(
          width: width,
          value: rightValue,
          minValue: leftValue,
          maxValue: maxValue,
          onUpdate: onSecondUpdate,
          isSecond: true,
        ),
      ],
    );
  }

  /// Ширина слайдера
  final double width;

  /// Значение левой кнопки
  final int leftValue;

  /// Значение правой кнопки
  final int? rightValue;

  /// Действие на движение первой кнопки
  final void Function(int)? onFirstUpdate;

  /// Действие на движение второй кнопки
  final void Function(int)? onSecondUpdate;

  /// Список кнопок
  final List<SliderButton> buttons;

  /// С/без графиком(-а)
  final bool? withChart;

  /// Значение для графика
  final List<int>? chartValue;

  @override
  Widget build(BuildContext context) {
    final CustomPainter painter =
        _LinePainter(colorScheme: context.myColorScheme);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        height: withChart ?? true ? 82 : 52,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (withChart ?? false)
              Positioned(
                height: 72,
                width: width - 4,
                bottom: 26,
                left: -17,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: FilterChart(array: chartValue!),
                ),
              ),
            Positioned(
              bottom: -6,
              left: 16,
              child: SizedBox(
                width: width - 82,
                height: 32,
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            ),
            ...buttons,
          ],
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  _LinePainter({required this.colorScheme});

  final MyColorScheme colorScheme;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorScheme.primary
      ..strokeWidth = 1;

    canvas
      ..drawCircle(Offset.zero, 4, paint)
      ..drawLine(
        Offset.zero,
        Offset(size.width, 0),
        paint,
      )
      ..drawCircle(Offset(size.width, 0), 4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
