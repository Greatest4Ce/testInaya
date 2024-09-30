import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';

/// Карусель изображений элемента
class ImageSlider extends StatefulWidget {
  /// Конструктор, в который необходимо передать [imagePaths]
  /// и опционально [pageController]
  const ImageSlider({
    required this.imagePaths,
    super.key,
    this.pageController,
  });

  /// Пути до изображений
  final Set<String> imagePaths;

  /// Контроллер
  final ScrollController? pageController;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentPage = 0;
  double? scrollPosition;
  late VoidCallback _listener;

  @override
  void initState() {
    if (widget.pageController != null) {
      _listener = () {
        setState(() {
          scrollPosition = widget.pageController!.offset;
        });
      };
      widget.pageController!.addListener(_listener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.pageController != null) {
      widget.pageController!.removeListener(_listener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: widget.imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imagePaths.elementAt(index),
                fit: BoxFit.cover,
              );
            },
          ),
          if (scrollPosition == null || scrollPosition! <= 120)
            Align(
              alignment: Alignment.bottomCenter,
              child: _ImageIndicator(
                currentIndex: currentPage,
                itemCount: widget.imagePaths.length,
              ),
            ),
        ],
      ),
    );
  }
}

class _ImageIndicator extends StatelessWidget {
  const _ImageIndicator({
    required this.currentIndex,
    required this.itemCount,
  });

  final int currentIndex;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: SizedBox(
        height: 10,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 8,
            );
          },
          itemBuilder: (context, index) {
            return CircleAvatar(
              backgroundColor: context.myColorScheme.surface,
              radius: index == currentIndex
                  ? 4
                  : index == 0
                      ? 2
                      : index == itemCount - 1
                          ? 2
                          : 3,
            );
          },
        ),
      ),
    );
  }
}
