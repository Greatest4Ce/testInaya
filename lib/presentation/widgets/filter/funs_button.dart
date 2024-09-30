import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_holder.dart';
import 'package:testinaya/domain/state/filter_page/filter_page_state_manager.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Кнопка для категории фильтров "Развлечения"
class FunsFilterButton extends ConsumerStatefulWidget {
  /// Стнадартный конструктор, в который необходимо передать
  /// [fun] типа [String]
  const FunsFilterButton({
    required this.fun,
    super.key,
  });

  /// Развлечени
  final String fun;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FunsFilterButtonState();
}

class _FunsFilterButtonState extends ConsumerState<FunsFilterButton>
    with TickerProviderStateMixin {
  late WidgetStatesController _stateController;

  @override
  void initState() {
    _stateController = WidgetStatesController();
    super.initState();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterPageState = ref.watch(filterPageStateHolder);
    final manager = ref.read(filterPageStateManager);
    final isActive = filterPageState.filters.funsFilters.contains(widget.fun);
    if (isActive) {
      _stateController.update(WidgetState.selected, true);
    } else {
      _stateController.update(WidgetState.selected, false);
    }
    return ValueListenableBuilder(
      valueListenable: _stateController,
      builder: (context, states, child) {
        if (states.contains(WidgetState.selected)) {
          return GestureDetector(
            onTap: () {
              manager.changeFilterValue(
                filterType: FilterCategory.funs,
                value: widget.fun,
                add: false,
              );
              _stateController.update(WidgetState.selected, false);
            },
            child: Container(
              height: 164,
              width: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: context.myColorScheme.inactive),
                color: context.myColorScheme.onSurface,
              ),
              padding: const EdgeInsets.all(28),
              child: Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/funs/${widget.fun}.png',
                      height: 80,
                      width: 108,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: t.funsMap[widget.fun],
                      children: [
                        TextSpan(
                          text: ' ${t.filters.count(
                            // TODO(Karimm): imlpementCount,
                            n: filterPageState
                                    .counts.countByFunsMap[widget.fun] ??
                                0,
                          )}',
                          style: context.textTheme.label?.copyWith(
                            color: context.myColorScheme.inactive,
                          ),
                        ),
                      ],
                    ),
                    style: context.textTheme.label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            manager.changeFilterValue(
              filterType: FilterCategory.funs,
              value: widget.fun,
              add: true,
            );
            _stateController.update(WidgetState.selected, true);
          },
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/funs/${widget.fun}.png',
                  height: 122,
                  width: 164,
                  fit: BoxFit.cover,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: t.funsMap[widget.fun],
                  children: [
                    TextSpan(
                      text: ' ${t.filters.count(
                        // TODO(Karimm): imlpementCount,
                        n: filterPageState.counts.countByFunsMap[widget.fun] ??
                            0,
                      )}',
                      style: context.textTheme.label?.copyWith(
                        color: context.myColorScheme.inactive,
                      ),
                    ),
                  ],
                ),
                style: context.textTheme.label,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        );
      },
    );
  }
}
