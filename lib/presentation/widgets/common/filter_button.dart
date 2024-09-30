import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/facility_icons.dart';
import 'package:testinaya/core/styles/icons/house_type_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/entity/item/item_entity/item_entity.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

enum ValueType {
  house,
  facility,
}

class FilterButton extends ConsumerStatefulWidget {
  const FilterButton({
    required this.filterType,
    required this.value,
    this.padding,
    this.withBorder = false,
    this.withCount = false,
    this.icon,
    super.key,
  });

  const FilterButton.big({
    required this.filterType,
    required this.value,
    this.padding = EdgeInsets.zero,
    this.withBorder = true,
    this.withCount = true,
    this.icon,
    super.key,
  });

  const FilterButton.small({
    required this.filterType,
    required this.value,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    this.withBorder = false,
    this.withCount = false,
    this.icon,
    super.key,
  });

  const FilterButton.smallAll({
    this.filterType = ValueType.house,
    this.value = const [...HouseType.values],
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    this.withBorder = false,
    this.icon = const Icon(Icons.more_horiz),
    this.withCount = false,
    super.key,
  });

  final ValueType filterType;
  final Object value;
  final Widget? icon;
  final bool? withCount;

  final EdgeInsetsGeometry? padding;
  final bool? withBorder;

  @override
  ConsumerState<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends ConsumerState<FilterButton> {
  late WidgetStatesController _controller;
  late Map<Object, Widget> iconsMap;
  late FilterCategory filterType;

  @override
  void initState() {
    switch (widget.filterType) {
      case ValueType.facility:
        iconsMap = _facilityIcons;
        filterType = FilterCategory.facilities;
      case ValueType.house:
        iconsMap = _houseIcons;
        filterType = FilterCategory.houseType;
      // ignore: no_default_cases
      default:
        iconsMap = {};
    }

    _controller = WidgetStatesController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _colorResolver(Set<WidgetState> states, Set<Object>? activeFilters) {
    late final bool? isActive;
    if (widget.value is Set) {
      isActive = activeFilters?.isEmpty;
    } else {
      isActive = activeFilters?.contains(widget.value);
    }
    if (states.contains(WidgetState.selected) && (isActive ?? true)) {
      return context.myColorScheme.onSurface;
    }
    return context.myColorScheme.surface;
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.read(filterPageStateManager);
    final valueCount = ref.watch(filterPageStateHolder).counts;
    late Set<Object>? state;
    switch (widget.filterType) {
      case ValueType.facility:
        state = ref.watch(filterPageStateHolder).filters.facilitiesFilters;
        if (state.contains(widget.value)) {
          _controller.update(WidgetState.selected, true);
        }
      case ValueType.house:
        state = ref.watch(filterPageStateHolder).filters.houseFilters;
        if (state.contains(widget.value)) {
          _controller.update(WidgetState.selected, true);
        }
      // ignore: no_default_cases
      default:
        state = null;
    }

    if (widget.value is Set) {
      if (state == null || state.isEmpty) {
        _controller.update(WidgetState.selected, true);
      } else {
        _controller.update(WidgetState.selected, false);
      }
    }
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, states, child) {
        return GestureDetector(
          onTap: () {
            if (states.contains(WidgetState.selected)) {
              _controller.update(WidgetState.selected, false);
              if (widget.value is Set) {
                manager.changeFilterValue(
                  filterType: filterType,
                  value: widget.value,
                  add: false,
                );
              } else {
                manager.changeFilterValue(
                  filterType: filterType,
                  value: widget.value,
                  add: false,
                );
              }
            } else {
              _controller.update(WidgetState.selected, true);
              if (widget.value is Set) {
                manager.clearHouseTypeFilters();
              } else {
                manager.changeFilterValue(
                  filterType: filterType,
                  value: widget.value,
                  add: true,
                );
              }
            }
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 140,
              maxHeight: 72,
              minWidth: 40,
              minHeight: 72,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _colorResolver(
                  states,
                  state,
                ),
                border: widget.withBorder!
                    ? Border.all(
                        color: context.myColorScheme.inactive,
                      )
                    : null,
              ),
              child: Padding(
                padding: widget.padding ?? EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null)
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: widget.icon,
                      )
                    else
                      iconsMap[widget.value]!,
                    if (widget.value is List)
                      Text(
                        t.home.all,
                        style: context.textTheme.little,
                      )
                    else
                      Text.rich(
                        TextSpan(
                          text: widget.filterType == ValueType.house
                              ? t.houseTypeMap[
                                  (widget.value as HouseType).stringValue()]!
                              : widget.filterType == ValueType.facility
                                  ? t.facilitiesMap[
                                      (widget.value as Facility).stringValue()]!
                                  : 'error',
                          children: [
                            if (widget.withCount ?? false)
                              TextSpan(
                                text: ' ${t.filters.count(
                                  // TODO(Karimm): imlpementCount,
                                  n: widget.filterType == ValueType.house
                                      ? valueCount.countByHouseMap[
                                              (widget.value as HouseType)] ??
                                          0
                                      : widget.filterType == ValueType.facility
                                          ? valueCount.countByFacilitiesMap[
                                                  (widget.value as Facility)] ??
                                              0
                                          : 0,
                                )}',
                                style: context.textTheme.label?.copyWith(
                                  color: context.myColorScheme.inactive,
                                ),
                              ),
                          ],
                        ),
                        style: context.textTheme.little,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Map<Facility, Widget> get _facilityIcons => {
        Facility.conditioner: FacilityIcons.conditioner,
        Facility.kitchen: FacilityIcons.kitchen,
        Facility.mangal: FacilityIcons.mangal,
        Facility.parking: FacilityIcons.parking,
        Facility.talkingHouse: FacilityIcons.talkingHouse,
        Facility.tv: FacilityIcons.tv,
        Facility.wifi: FacilityIcons.wifi,
      };

  Map<HouseType, Widget> get _houseIcons => {
        HouseType.aFrame: HouseTypeIcons.aFrame,
        HouseType.barnouse: HouseTypeIcons.barnHouse,
        HouseType.barrelHouse: HouseTypeIcons.barrelHouse,
        HouseType.modulHouse: HouseTypeIcons.modulHouse,
        HouseType.recreationCenter: HouseTypeIcons.recreationCenter,
        HouseType.safari: HouseTypeIcons.safari,
        HouseType.shale: HouseTypeIcons.shale,
        HouseType.sphere: HouseTypeIcons.sphere,
      };
}
