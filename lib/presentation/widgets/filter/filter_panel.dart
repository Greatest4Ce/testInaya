import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Панель действия на странице фильтров
class FilterPanel extends ConsumerWidget {
  /// Стандартный в конструктор, в который необходимпо передать
  /// [clear] типа [VoidCallback] - действие по нажатию на кнопку "Очистить"
  /// [filter] типа [VoidCallback] - действие по нажатию на кнопку
  /// "Показать [count] вариантов"
  /// [count] типа [int] - кол-во элементов, подходящих по фильтру
  const FilterPanel({
    required this.clear,
    required this.filter,
    required this.count,
    super.key,
  });

  /// Действие на кнопку "Очистить"
  final VoidCallback clear;

  /// Действие на кнопку "Показать [count] вариантов"
  final VoidCallback filter;

  /// Кол-во элементов, подходящих по фильтру
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: context.myColorScheme.surface,
      child: Container(
        width: double.maxFinite,
        height: 120,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.myColorScheme.surface,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, -4),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Wrap(
            spacing: 20,
            children: [
              TextButton(
                onPressed: () {
                  clear.call();
                  Navigator.of(context).pop();
                },
                child: Text(t.filters.clear),
              ),
              FilledButton(
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(249, 48)),
                ),
                onPressed: () {
                  filter.call();
                  Navigator.of(context).pop();
                },
                child: Text(t.filters.showVariants(n: count)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
