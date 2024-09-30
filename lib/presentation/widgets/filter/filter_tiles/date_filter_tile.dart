import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/filter/filter_dates_picker.dart';

/// Панель категории фильтров "По дате"
class DateFilterTile extends ConsumerWidget {
  /// СТандартный конструктор
  const DateFilterTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(filterPageStateHolder);
    final pageManager = ref.read(filterPageStateManager);

    final dates = pageState.filters.dates;

    OutlinedBorder shapeResolver(
      Set<WidgetState> states,
      Set<DateTime>? dates,
    ) {
      final shape =
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      if (dates == null) {
        return shape.copyWith(
          side: BorderSide(color: context.myColorScheme.inactive),
        );
      } else {
        return shape.copyWith(
          side: BorderSide(color: context.myColorScheme.primary),
        );
      }
    }

    return SliverToBoxAdapter(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text.rich(
          TextSpan(
            text: t.filters.dates,
            style: context.textTheme.h3,
            children: [
              TextSpan(
                text: ' ${t.filters.count(n: pageState.counts.countByDate)}',
                style: context.textTheme.h3
                    ?.copyWith(color: context.myColorScheme.inactive),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Theme(
            data: ThemeData(primaryColor: context.myColorScheme.primary),
            child: TextButton.icon(
              onPressed: () async {
                final result = await showFilterDatesPicker(context);
                pageManager.changeFilterValue(
                  filterType: FilterCategory.date,
                  value: result ?? {},
                );
              },
              label: Row(
                children: [
                  if (dates != null)
                    Text(_foramtDates(dates))
                  else
                    Text(t.filters.nearest),
                ],
              ),
              icon: const Icon(ButtonIcons.calendar),
              iconAlignment: IconAlignment.end,
              style: ButtonStyle(
                // alignment: Alignment.centerLeft,
                fixedSize:
                    const WidgetStatePropertyAll(Size(double.maxFinite, 48)),
                shape: WidgetStateProperty.resolveWith(
                  (states) => shapeResolver(states, dates),
                ),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                foregroundColor: WidgetStatePropertyAll(
                  context.myColorScheme.primary,
                ),
                textStyle: WidgetStatePropertyAll(context.textTheme.button),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _foramtDates(Set<DateTime> dates) {
  final first = dates.first.day;
  final second = DateFormat('d MMMM yyyy', 'ru_RU').format(dates.last);
  return '$first-$second';
}
