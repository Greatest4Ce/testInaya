import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/filter/funs_button.dart';

/// Панель категории фильтров "Развлечения"
class FunsFilterTile extends ConsumerWidget {
  /// Стандартный конструктор
  const FunsFilterTile({super.key});

  static const _funs = <String>[
    'bicycles',
    'billiard',
    'furako',
    'horseSport',
    'jakuzi',
    'lake',
    'pool',
    'supboard',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(filterPageStateHolder);
    final pageManager = ref.read(filterPageStateManager);
    final count = pageState.counts.countByFuns;
    return SliverToBoxAdapter(
      child: ExpansionTile(
        dense: true,
        maintainState: true,
        initiallyExpanded: pageState.filterTilesState.funsExpanded,
        onExpansionChanged: (value) {
          pageManager.changeTileState(
            filterTile: FilterTile.funs,
            value: value,
          );
        },
        title: Text.rich(
          TextSpan(
            text: t.filters.funs,
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
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              childAspectRatio: 1 / .9,
              crossAxisSpacing: 8,
            ),
            children: _funs.map((fun) {
              return FunsFilterButton(fun: fun);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
