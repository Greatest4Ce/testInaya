import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Карточка, на которой примерное местоположение, адрес и кнопка "Маршрут"
class LocationTile extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const LocationTile({
    required this.item,
    super.key,
  });

  /// Элемент данные которого будут отображаться
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 28),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        isThreeLine: true,
        dense: true,
        contentPadding: EdgeInsets.zero,
        subtitle: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            t.detail.address(address: item.address, count: item.distance),
            style: context.textTheme.littleAddress,
          ),
        ),
        trailing: IconButton.filled(
          icon: const Icon(ButtonIcons.route),
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(context.myColorScheme.primary),
            foregroundColor:
                WidgetStatePropertyAll(context.myColorScheme.surface),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
