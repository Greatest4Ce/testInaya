import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/facility_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Сетка, которая отображает включенные удобства
class FacilitiesGrid extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [item] типа [ItemEntity]
  const FacilitiesGrid({
    required this.item,
    super.key,
  });

  /// Элемент, удобства которог буду отображаться
  final ItemEntity item;

  /// Коллеция иконок удобств
  Map<Facility, Widget> get icons => {
        Facility.conditioner: FacilityIcons.conditioner,
        Facility.kitchen: FacilityIcons.kitchen,
        Facility.mangal: FacilityIcons.mangal,
        Facility.parking: FacilityIcons.parking,
        Facility.talkingHouse: FacilityIcons.talkingHouse,
        Facility.tv: FacilityIcons.tv,
        Facility.wifi: FacilityIcons.wifi,
      };

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: item.facilities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 0.25,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 114,
          width: 162,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.myColorScheme.inactive,
              ),
            ),
          ),
          child: Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: icons[item.facilities.elementAt(index)],
              ),
              Text(
                t.facilitiesMap[
                    item.facilities.elementAt(index).stringValue()]!,
                style: context.textTheme.label,
              ),
            ],
          ),
        );
      },
    );
  }
}
