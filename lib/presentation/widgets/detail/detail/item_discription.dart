import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/presentation/widgets/detail/detail/actions_row.dart';
import 'package:testinaya/presentation/widgets/detail/detail/location_tile.dart';

/// Виджет описания элемента
class ItemDiscription extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const ItemDiscription({
    required this.item,
    super.key,
  });

  /// Элемент, описание которого будет отображаться
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: context.textTheme.h2,
          ),
          LocationTile(
            item: item,
          ),
          const ActionsRow(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 26,
            ),
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: context.myColorScheme.onSurface,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Text(
              '''На сообщения отвечает дольше других, \nсвязывайтесь по телефону''',
              style: context.textTheme.p,
            ),
          ),
          Text(
            item.body,
            style: context.textTheme.p,
          ),
        ],
      ),
    );
  }
}
