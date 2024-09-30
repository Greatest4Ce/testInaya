import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';
import 'package:testinaya/core/styles/icons/button_icons.dart';
import 'package:testinaya/core/styles/typography/text_theme.dart';
import 'package:testinaya/domain/state/items/items_state_holder.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';
import 'package:testinaya/presentation/widgets/common/card_image_slider.dart';
import 'package:testinaya/presentation/widgets/detail/detail.dart';

@RoutePage()

/// Страница подробного обзора элемента
class DetailsPage extends ConsumerStatefulWidget {
  /// Конструктор, в который необходимпо передать id элемента
  const DetailsPage({
    required this.itemId,
    super.key,
  });

  /// id элемента
  final String itemId;

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  late ScrollController _controller;
  bool liked = false;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = ref
        .watch(itemsStateHolder)
        .singleWhere((item) => item.id == widget.itemId);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _controller,
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                foregroundColor: context.myColorScheme.surface,
                surfaceTintColor: context.myColorScheme.surface,
                backgroundColor: context.myColorScheme.surface,
                stretch: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: ImageSlider(
                    pageController: _controller,
                    imagePaths: item.imagePaths,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, right: 8),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon: Icon(
                        item.liked
                            ? ButtonIcons.heartfilled
                            : ButtonIcons.heartoutlined,
                      ),
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: ItemDiscription(item: item),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    t.filters.funs,
                    style: context.textTheme.h2,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FunsList(
                  item: item,
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    t.filters.facilities,
                    style: context.textTheme.h2,
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                sliver: FacilitiesGrid(item: item),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    t.detail.sleepPlaces,
                    style: context.textTheme.h2,
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                sliver: SleepPlaceList(item: item),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BookPanel(
              item: item,
            ),
          ),
        ],
      ),
    );
  }
}
