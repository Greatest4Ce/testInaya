import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';

/// Тип кнопки слайдера
enum SliderButtonType {
  /// Обведенная
  outlined,

  /// Залитая
  filled,
}

/// Кнопка для слайдера в фильтрах
class SliderButton extends StatefulWidget {
  ///  Стандартный конструктор, в который необходимо передать
  /// [value] - значение, за которое отвечает кнопка
  /// [maxValue] - максимальное значение кнопки
  /// [onUpdate} - действие на изменение позции кнопки
  /// [boxDecoration] - стилизация кнопки
  /// [minValue] - минимальное значение
  /// [width] - ширина всего слайдера
  /// [type] - тип кнопки
  /// [isSecond] - является ли кнопка правой
  const SliderButton({
    required this.value,
    required this.maxValue,
    required this.onUpdate,
    required this.boxDecoration,
    required this.minValue,
    required this.width,
    super.key,
    this.type,
    this.isSecond = false,
  });

  /// Создает залитую кнопку
  const SliderButton.filled({
    required this.value,
    required this.maxValue,
    required this.onUpdate,
    required this.minValue,
    required this.width,
    super.key,
    this.type = SliderButtonType.filled,
    this.boxDecoration,
    this.isSecond = false,
  });

  /// Создает обведенную кнопку
  const SliderButton.outlined({
    required this.value,
    required this.maxValue,
    required this.onUpdate,
    required this.minValue,
    required this.width,
    super.key,
    this.type = SliderButtonType.outlined,
    this.boxDecoration,
    this.isSecond = false,
  });

  /// Значение кнопки
  final int value;

  /// Максимальное значение кнопки
  final int maxValue;

  /// Минимальное значение кнопки
  final int minValue;

  /// Ширинка всего слайдер
  final double width;

  /// Является ли кнопка правой
  final bool isSecond;

  /// Действие на изменение позции кнопки
  final void Function(int)? onUpdate;

  /// Тип кнопки
  final SliderButtonType? type;

  /// Стилизация кнопки
  final BoxDecoration? boxDecoration;

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  late double minPosition;
  late double maxPosition;
  late double pPercent;
  late double position;
  late double vPercent;
  late double kVp;
  late double width;

  late WidgetStatesController _statesController;

  @override
  void initState() {
    _statesController = WidgetStatesController();
    width = widget.width - 82;
    kVp = widget.maxValue / width;
    super.initState();
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSecond) {
      if (widget.value == widget.minValue) {
        vPercent = widget.value / widget.maxValue;
      } else {
        vPercent = widget.value / widget.maxValue;
      }
    } else {
      if (widget.value == widget.minValue) {
        vPercent = 0;
      } else {
        vPercent = widget.value / widget.maxValue;
      }
    }

    maxPosition = widget.maxValue / kVp;
    minPosition = widget.minValue / kVp;
    pPercent = vPercent;
    position = pPercent * maxPosition;
    final filledDecoration = BoxDecoration(
      color: context.myColorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: context.myColorScheme.primary,
        width: 12,
      ),
    );
    final outlinedDecoration = BoxDecoration(
      color: context.myColorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: context.myColorScheme.primary,
        width: 2,
      ),
    );

    return Positioned(
      height: 32,
      width: 32,
      left: position,
      bottom: 10,
      child: GestureDetector(
        onPanDown: (details) {},
        onPanEnd: (details) {},
        onHorizontalDragStart: (details) {
          _statesController.update(WidgetState.pressed, true);
        },
        onHorizontalDragUpdate: (details) {
          final newPosition = position + details.delta.dx;
          final deltaValue = details.delta.dx * kVp;
          final newValue = (widget.value + deltaValue).round();
          if (newPosition >= 0 && newPosition <= width) {
            setState(() {
              position += details.delta.dx;
            });
            if (widget.minValue <= newValue && newValue <= widget.maxValue) {
              widget.onUpdate?.call(newValue);
            } else if (newValue < widget.minValue) {
              widget.onUpdate?.call(widget.minValue);
            }
          }
        },
        onHorizontalDragEnd: (details) {
          _statesController.update(WidgetState.pressed, false);
        },
        child: ValueListenableBuilder(
          valueListenable: _statesController,
          builder: (context, states, child) {
            return Container(
              height: 32,
              width: 32,
              decoration: (widget.type == SliderButtonType.outlined
                      ? outlinedDecoration
                      : widget.type == SliderButtonType.filled
                          ? filledDecoration
                          : widget.boxDecoration)
                  ?.copyWith(
                boxShadow: states.contains(WidgetState.pressed)
                    ? [
                        BoxShadow(
                          color: context.myColorScheme.inactive,
                          spreadRadius: 0.1,
                          blurRadius: 5,
                        ),
                      ]
                    : [],
              ),
            );
          },
        ),
      ),
    );
  }
}
