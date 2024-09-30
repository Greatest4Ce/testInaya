import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/filter/filter_panel.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/date_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/distance_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/facilities_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/funs_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/house_type_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/place_count_filter_tile.dart';
import 'package:testinaya/presentation/widgets/filter/filter_tiles/price_filter_tile.dart';

/// Список панелей групп фильтров с разделителями
class FiltersList extends ConsumerWidget {
  /// Стандартный конструктор
  const FiltersList({super.key});

  static const Widget _divider = SliverToBoxAdapter(
    child: Divider(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(filterPageStateHolder);
    final manager = ref.read(filterPageStateManager);
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.myColorScheme.surface,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        t.filters.filters,
                        style: context.textTheme.h2,
                      ),
                    ),
                    const DateFilterTile(),
                    _divider,
                    const PriceFilterTile(),
                    _divider,
                    const DistanceFilterTile(),
                    _divider,
                    const HouseTypeFilterTile(),
                    _divider,
                    const PlacesCountFilterTile(),
                    _divider,
                    const FacilitiesFilterTile(),
                    _divider,
                    const FunsFilterTile(),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FilterPanel(
                  clear: manager.clearFilters,
                  filter: manager.filter,
                  count: pageState.counts.minCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
