import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// НИжня панелька с кнопкой "Забронировать" на экране обзора элемента
class BookPanel extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const BookPanel({required this.item, super.key});

  /// Элемент данные, которого будут отображаться в панели
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.myColorScheme.surface,
      child: Container(
        width: double.maxFinite,
        height: 98,
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
            spacing: 24,
            children: [
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    '${item.minGuests}-${item.maxGuests} ${t.home.guests}',
                    style: context.textTheme.p?.copyWith(
                      color: context.myColorScheme.inactive,
                    ),
                  ),
                  Text(
                    '${t.detail.from} ${NumberFormat.simpleCurrency(
                      locale: 'ru_RU',
                      decimalDigits: 0,
                      // symbol: t.detail.ruble,
                      // customPattern: '#0',
                    ).format(item.price)} ',
                    style: context.textTheme.p?.copyWith(),
                  ),
                ],
              ),
              FilledButton(
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(249, 48)),
                ),
                onPressed: () {},
                child: Text(t.detail.book),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
