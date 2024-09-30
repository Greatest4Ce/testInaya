import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/sleep_place_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Список доступных спальных мест
class SleepPlaceList extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const SleepPlaceList({
    required this.item,
    super.key,
  });

  /// Элемент, спальные места которого убуд отображаться
  final ItemEntity item;

  /// Коллекция иконок спальных мест
  Map<String, Widget> get icons => {
        'queenBed': SleepPlaceIcons.queenBed,
        'babyPlace': SleepPlaceIcons.babyPlace,
        'sofa': SleepPlaceIcons.sofa,
      };

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: item.sleepPlaces.length,
      itemBuilder: (context, index) {
        final sleepingPlace = item.sleepPlaces.elementAt(index);
        return Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.myColorScheme.inactive,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: icons[sleepingPlace.value.stringValue()],
                  ),
                  Text(
                    t.sleepPlaceMap[sleepingPlace.value.stringValue()]!,
                    style: context.textTheme.p,
                  ),
                ],
              ),
              Text(
                sleepingPlace.count.toString(),
                style: context.textTheme.p
                    ?.copyWith(color: context.myColorScheme.inactive),
              ),
            ],
          ),
        );
      },
    );
  }
}
