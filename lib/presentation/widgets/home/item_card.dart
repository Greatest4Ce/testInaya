import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testinaya/core/router/router.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/core/utils/price_fromatter.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/pages/detail_page.dart';
import 'package:testinaya/presentation/widgets/common/card_image_slider.dart';

/// Карточка элемента
class ItemCard extends StatelessWidget {
  /// Карточка элемента
  const ItemCard({
    required this.item,
    super.key,
  });

  /// Элемент, подробности которого буду показаны на экране [DetailsPage]
  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          DetailsRoute(itemId: item.id),
        );
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 447, minWidth: 335),
        margin: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: context.myColorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 4),
              blurRadius: 12,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ImageSlider(imagePaths: item.imagePaths),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: context.myColorScheme.surface,
                      ),
                      child: Wrap(
                        spacing: 3,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.near_me,
                            size: item.distance > 200 ? 14 : 18,
                          ),
                          Text(
                            t.filters.km(km: item.distance),
                            style: context.textTheme.label,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                runSpacing: 2,
                children: [
                  Text(
                    item.title,
                    style: context.textTheme.h3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDate(item.dates),
                        style: context.textTheme.p?.copyWith(
                          color: context.myColorScheme.inactive,
                        ),
                      ),
                      Text(
                        '${item.views} ${t.home.views}',
                        style: context.textTheme.button,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.minGuests}-${item.maxGuests} ${t.home.guests}',
                        style: context.textTheme.p?.copyWith(
                          color: context.myColorScheme.inactive,
                        ),
                      ),
                      Text(
                        '${t.detail.from} ${formatPrice(
                          item.price,
                          const Locale('ru_RU'),
                        )} ',
                        style: context.textTheme.button,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDate(Set<DateTime> dates) {
  final firstDate = DateFormat('d').format(dates.first);
  final secondDate = DateFormat('d MMMM', 'ru_RU').format(dates.last);
  return '$firstDate-$secondDate';
}
