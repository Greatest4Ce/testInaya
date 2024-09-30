import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/common/filter_button.dart';

/// Панель категории фильтров "По типу дома"
class HouseTypeFilterTile extends ConsumerWidget {
  /// Стандартный конструктор
  const HouseTypeFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(filterPageStateHolder);
    final pageManager = ref.read(filterPageStateManager);
    final filterState = pageState.filters;
    final count = pageState.counts.countByHouse;
    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        maintainState: true,
        initiallyExpanded: pageState.filterTilesState.houseTypeExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.houseType,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.houses,
            style: context.textTheme.h3,
            children: [
              if (count > 0)
                TextSpan(
                  text: ' ${t.filters.count(n: count)}',
                  style: context.textTheme.h3
                      ?.copyWith(color: context.myColorScheme.inactive),
                ),
            ],
          ),
        ),
        subtitle: filterState.houseFilters.isNotEmpty
            ? Text(
                filterState.houseFilters
                    .map((type) => t.houseTypeMap[type.stringValue()])
                    .join(', '),
              )
            : null,
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              childAspectRatio: 1 / 0.55,
              crossAxisSpacing: 8,
            ),
            children: HouseType.values.map((filter) {
              return FilterButton.big(
                filterType: ValueType.house,
                value: filter,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
