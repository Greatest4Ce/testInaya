import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testinaya/core/styles/colors/light_colors.dart';

/// Виджет, который строит BarChart
class FilterChart extends StatelessWidget {
  /// Стандартный конструктор, в который необходимо передать
  /// [List]<[int]>, по которым будет строиться графи
  const FilterChart({
    required this.array,
    super.key,
  });

  /// [List]<[int]>, по которым будет строиться графи
  final List<int> array;

  @override
  Widget build(BuildContext context) {
    array.sort();
    final delta = ((array.last - array.first) / 66).roundToDouble();
    final maxValueInArray = array.reduce(max);
    final ranges = _buildRanges(delta, maxValueInArray);
    final filledRanges = _filledRanges(array, ranges);
    final maxValueInRange = filledRanges.reduce(max);
    final barWidth = MediaQuery.of(context).size.width * 4 / 415;

    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: filledRanges.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          final percent = double.parse(
            (filledRanges[index] / maxValueInRange).toStringAsFixed(2),
          );
          final barHeight = percent * 56.roundToDouble() / 100;

          return Container(
            constraints: BoxConstraints(minWidth: barWidth),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  barHeight,
                  barHeight,
                  1.0,
                ],
                colors: [
                  context.myColorScheme.onSurface,
                  context.myColorScheme.surface,
                  context.myColorScheme.surface,
                ],
              ),
            ),
            height: barHeight,
            margin: const EdgeInsets.symmetric(horizontal: 0.5),
          );
        },
      ),
    );
  }
}

List<List<double>> _mergeRanges(List<List<double>> arrays) {
  final result = arrays
    ..sort((a, b) {
      return a.first.compareTo(b.first);
    });

  var i = 0;
  while (result.length > 66) {
    final first = result[i];
    final second = result[i + 1];

    if (second.first <= first.last && first.last <= second.last) {
      result[i] = [first.first, max(first.last, second.last)];
      result.removeAt(i + 1);
      i = 0;
    } else {
      i++;
    }
  }
  return result;
}

List<List<double>> _buildRanges(double delta, int maxValue) {
  var x = 0.0;
  final result = <List<double>>[];
  while (x < maxValue - delta) {
    result.add([x, x + delta]);
    x += delta;
  }
  result.add([maxValue - delta, maxValue.toDouble()]);
  return _mergeRanges(result);
}

List<int> _filledRanges(List<int> array, List<List<double>> ranges) {
  // final result = array.map((digit) => _binarySearch(digit, ranges)).toList();
  final result = List<int>.generate(66, (index) {
    return 0;
  });
  for (final digit in array) {
    final range = ranges.indexOf(_binarySearch(digit, ranges));
    result[range]++;
  }
  return result;
}

List<double> _binarySearch(int value, List<List<double>> ranges) {
  final index = (ranges.length / 2).floor();
  final range = ranges[index];
  final first = range.first;
  final second = range.last;
  if (first <= value && value <= second) {
    return range;
  } else if (value > second) {
    return _binarySearch(value, ranges.sublist(index + 1));
  } else {
    return _binarySearch(value, ranges.sublist(0, index));
  }
}
