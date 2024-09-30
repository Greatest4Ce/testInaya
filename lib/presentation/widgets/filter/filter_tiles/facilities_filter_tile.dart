import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/common/filter_button.dart';

/// Панель категории фильтров "Удобства"
class FacilitiesFilterTile extends ConsumerWidget {
  /// Стандартный конструктор
  const FacilitiesFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterPageStateHolder).filters;
    final pageState = ref.watch(filterPageStateHolder);
    final pageManager = ref.read(filterPageStateManager);
    final count = pageState.counts.countByFacilities;
    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        maintainState: true,
        initiallyExpanded: pageState.filterTilesState.facilitiesExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.facilities,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.facilities,
            style: context.textTheme.h3,
            children: [
              if (count > 0)
                TextSpan(
                  text: ''' ${t.filters.count(n: count)}''',
                  style: context.textTheme.h3
                      ?.copyWith(color: context.myColorScheme.inactive),
                ),
            ],
          ),
        ),
        subtitle: filterState.facilitiesFilters.isNotEmpty
            ? Text(
                filterState.facilitiesFilters
                    .map((facility) => t.facilitiesMap[facility.name])
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
              childAspectRatio: 1 / 0.6,
              crossAxisSpacing: 8,
            ),
            children: Facility.values.map((filter) {
              return FilterButton.big(
                filterType: ValueType.facility,
                value: filter,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
