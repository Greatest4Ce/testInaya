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

class DistanceFilterTile extends ConsumerWidget {
  const DistanceFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsStateHolder);
    final pageState = ref.watch(filterPageStateHolder);
    final filterState = pageState.filters;
    final pageManager = ref.read(filterPageStateManager);
    final minDistance = items.map((item) => item.distance).reduce(min);
    final maxDisatnce = items.map((item) => item.distance).reduce(max);

    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        // maintainState: true,
        initiallyExpanded: pageState.filterTilesState.distanceExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.distance,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.distance,
            style: context.textTheme.h3,
            children: [
              TextSpan(
                text:
                    ' ${t.filters.count(n: pageState.counts.countByDistance)}',
                style: context.textTheme.h3
                    ?.copyWith(color: context.myColorScheme.inactive),
              ),
            ],
          ),
        ),
        subtitle: Wrap(
          spacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.near_me,
              size: 12,
              color: context.myColorScheme.primary,
            ),
            Text(
              t.filters.km(km: filterState.distanceFilter),
              style: context.textTheme.p,
            ),
          ],
        ),
        children: [
          FilterSlider.oneValue(
            width: MediaQuery.of(context).size.width,
            onUpdate: (value) {
              pageManager.changeFilterValue(
                filterType: FilterCategory.distance,
                value: value,
              );
            },
            leftValue: filterState.distanceFilter,
            maxValue: maxDisatnce,
            minValue: minDistance,
            withChart: true,
            chartValues: items.map((item) => item.distance).toList(),
          ),
        ],
      ),
    );
  }
}
