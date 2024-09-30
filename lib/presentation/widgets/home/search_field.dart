// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

/// Виджет поиска по наименованию
class SearchField extends ConsumerStatefulWidget {
  /// Стандартный конструкторв, в котороый необходимпо передать
  /// [searchController] - контроллер
  /// [items] - предлагаемые варианты
  /// [onSelected] - действие при выборе варианта
  const SearchField({
    required this.searchController,
    required this.items,
    required this.onSelected,
    super.key,
  });

  /// Контролле
  final SearchController searchController;

  /// Предлагаемые вариант
  final Set<String> items;

  /// Действие при выборе варианта
  final void Function(String) onSelected;

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  final Set<String> options = {};
  late FocusNode _focusNode;

  @override
  void initState() {
    widget.searchController.addListener(
      _searchControllerListener,
    );
    _focusNode = FocusNode();
    super.initState();
  }

  void _searchControllerListener() {
    if (!widget.searchController.isOpen) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: SearchAnchor(
            viewHintText: t.home.search,
            searchController: widget.searchController,
            viewLeading: Container(),
            viewTrailing: [
              IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  widget.searchController.closeView('');
                  widget.onSelected('');
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
            viewConstraints: const BoxConstraints(
              maxHeight: 300,
            ),
            isFullScreen: false,
            viewShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            viewBackgroundColor: context.myColorScheme.surface,
            viewElevation: 0.5,
            builder: (context, controller) => SearchBar(
              focusNode: _focusNode,
              hintText: t.home.search,
              leading: const Icon(
                ButtonIcons.search,
                size: 18,
              ),
              controller: widget.searchController,
              onChanged: (_) {
                widget.searchController.openView();
              },
              onTap: () {
                widget.searchController.openView();
              },
              backgroundColor: WidgetStatePropertyAll<Color>(
                context.myColorScheme.surface,
              ),
              elevation: const WidgetStatePropertyAll(0),
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: context.myColorScheme.primary,
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            suggestionsBuilder: (context, controller) async {
              if (options.isEmpty && controller.text.trim().isEmpty) {
                options.addAll(widget.items);
              }
              final suggestions = options
                  .where(
                    (element) => element
                        .toLowerCase()
                        .contains(controller.text.toLowerCase()),
                  )
                  .toSet();
              if (suggestions.isEmpty) {
                return ['Нет подходящих вариантов'].map(
                  (e) => Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        e,
                        style: context.textTheme.label,
                      ),
                    ),
                  ),
                );
              }
              return suggestions.map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    controller.closeView(e);
                    widget.onSelected.call(e);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
