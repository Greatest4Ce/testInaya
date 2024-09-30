import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/core/utils/price_fromatter.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/filter/filter_slider.dart';

/// Панель категории фильтров "По цене"
class PriceFilterTile extends ConsumerWidget {
  /// Стандартный конструктор
  const PriceFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsStateHolder);
    final filterManager = ref.read(filterPageStateManager);
    final pageState = ref.watch(filterPageStateHolder);
    final pageManager = ref.read(filterPageStateManager);
    final filterState = pageState.filters;
    final minPrice = items.map((item) => item.price).reduce(min);
    final maxPrice = items.map((item) => item.price).reduce(max);

    double midPrice() {
      num sum = 0;
      for (final e in items) {
        sum += e.price;
      }
      return sum / items.length;
    }

    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        // maintainState: true,
        initiallyExpanded: pageState.filterTilesState.priceExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.price,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.priceRangeTitle,
            style: context.textTheme.h3,
            children: [
              TextSpan(
                text: ' ${t.filters.count(n: pageState.counts.countByPrice)}',
                style: context.textTheme.h3
                    ?.copyWith(color: context.myColorScheme.inactive),
              ),
            ],
          ),
        ),
        subtitle: Text(
          t.filters.priceRange(
            start: formatPrice(
              filterState.priceFilter.minPrice,
              const Locale('ru_RU'),
            ),
            end: formatPrice(
              filterState.priceFilter.maxPrice,
              const Locale('ru_RU'),
            ),
          ),
          style: context.textTheme.p,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              t.filters.averagePriceForDay(
                price: formatPrice(midPrice(), const Locale('ru_RU')),
              ),
              style: context.textTheme.p
                  ?.copyWith(color: context.myColorScheme.inactive),
            ),
          ),
          FilterSlider.twoValue(
            width: MediaQuery.of(context).size.width,
            leftValue: filterState.priceFilter.minPrice,
            rightValue: filterState.priceFilter.maxPrice,
            minValue: minPrice,
            maxValue: maxPrice,
            onFirstUpdate: (value) {
              filterManager.changeFilterValue(
                filterType: FilterCategory.minPrice,
                value: value,
              );
            },
            onSecondUpdate: (value) {
              filterManager.changeFilterValue(
                filterType: FilterCategory.maxPrice,
                value: value,
              );
            },
            withChart: true,
            chartValues: items.map((item) => item.price).toList(),
          ),
        ],
      ),
    );
  }
}
