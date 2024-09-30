import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/common/filter_button.dart';
import 'package:testinaya/presentation/widgets/filter/filters_list.dart';
import 'package:testinaya/presentation/widgets/home/item_card.dart';
import 'package:testinaya/presentation/widgets/home/search_field.dart';

@RoutePage()

/// Основная страница со списком отсортированных или всех элементов
class MyHomePage extends ConsumerStatefulWidget {
  /// Основная страница со списком отсортированных или всех элементов
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late Set<ItemEntity> items;
  late SearchController _searchController;

  @override
  void initState() {
    _searchController = SearchController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(itemsStateHolder);
    final filterState = ref.watch(filterPageStateHolder);
    final filteredItems = filterState.filteredList;
    late Set<ItemEntity> items;
    if (filteredItems.isNotEmpty) {
      items = filteredItems;
    } else {
      items = allItems;
    }
    if (filterState.filters.houseFilters.isNotEmpty) {
      items = items
          .where((item) => filterState.filters.houseFilters.contains(item.type))
          .toSet();
    }
    if (_searchController.text.isNotEmpty) {
      items = items
          .where(
            (item) => item.title
                .trim()
                .toLowerCase()
                .contains(_searchController.text.trim().toLowerCase()),
          )
          .toSet();
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FilledButton.icon(
        label: Text(t.home.onMap),
        icon: const Icon(ButtonIcons.map),
        onPressed: () {
          // TODO(Someone): implement onMap
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: context.myColorScheme.surface,
            backgroundColor: context.myColorScheme.surface,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconButton(
                onPressed: () {
                  // TODO(Someone): implement menu
                },
                icon: const Icon(
                  ButtonIcons.menu,
                  size: 14,
                ),
              ),
            ),
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SearchField(
                searchController: _searchController,
                onSelected: (value) {
                  setState(() {
                    _searchController.text = value;
                  });
                },
                items: items.map((item) => item.title).toSet(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(context.myColorScheme.primary),
                    foregroundColor:
                        WidgetStatePropertyAll(context.myColorScheme.surface),
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        minWidth: double.maxFinite,
                        maxWidth: double.maxFinite,
                        maxHeight: MediaQuery.of(context).size.height * .85,
                      ),
                      builder: (context) {
                        return const FiltersList();
                      },
                    );
                  },
                  icon: const Icon(ButtonIcons.filters),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(double.maxFinite, 74),
              child: SizedBox(
                height: 72,
                child: ListView.builder(
                  itemCount: HouseType.values.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: FilterButton.smallAll(),
                      );
                    } else if (index == HouseType.values.length) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: FilterButton.small(
                          filterType: ValueType.house,
                          value: HouseType.values[index - 1],
                        ),
                      );
                    } else {
                      return FilterButton.small(
                        filterType: ValueType.house,
                        value: HouseType.values[index - 1],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              items.map((item) {
                return ItemCard(item: item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
