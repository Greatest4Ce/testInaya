import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/filter/filter_slider.dart';

/// Панель категории фильтров "Количество мест"
class PlacesCountFilterTile extends ConsumerWidget {
  /// Стандартный конструктор
  const PlacesCountFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(filterPageStateHolder);
    final filterState = pageState.filters;
    final pageManager = ref.read(filterPageStateManager);
    final items = ref.watch(itemsStateHolder);
    final minPlaces = items.map((item) => item.sleepPlacesCount).reduce(min);
    final maxPlaces = items.map((item) => item.sleepPlacesCount).reduce(max);

    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        maintainState: true,
        initiallyExpanded: pageState.filterTilesState.placesCountExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.placesCount,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.placeCount,
            style: context.textTheme.h3,
            children: [
              TextSpan(
                text:
                    ''' ${t.filters.count(n: pageState.counts.countByPlaceCount)}''',
                style: context.textTheme.h3
                    ?.copyWith(color: context.myColorScheme.inactive),
              ),
            ],
          ),
        ),
        subtitle: Text(
          '''${filterState.placeCountFilters.minPlaces} - ${filterState.placeCountFilters.maxPlaces}''',
          style: context.textTheme.p,
        ),
        children: [
          FilterSlider.twoValue(
            width: MediaQuery.of(context).size.width,
            leftValue: filterState.placeCountFilters.minPlaces,
            rightValue: filterState.placeCountFilters.maxPlaces,
            minValue: minPlaces,
            maxValue: maxPlaces,
            onFirstUpdate: (value) {
              pageManager.changeFilterValue(
                filterType: FilterCategory.minPlacesCount,
                value: value,
              );
            },
            onSecondUpdate: (value) {
              pageManager.changeFilterValue(
                filterType: FilterCategory.maxPlacesCount,
                value: value,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.filters.placeForBaby,
                  style: context.textTheme.p,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  children: [
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: IconButton.outlined(
                        onPressed: () {
                          pageManager.changeFilterValue(
                            filterType: FilterCategory.babyPlace,
                            value: 0,
                            add: false,
                          );
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 16,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 19,
                      child: Text(
                        filterState.placeCountFilters.babyPlace.toString(),
                        style: context.textTheme.p,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: IconButton.outlined(
                        onPressed: () {
                          pageManager.changeFilterValue(
                            filterType: FilterCategory.babyPlace,
                            value: 0,
                            add: true,
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
