import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Метод, которы возвращает
/// Для iOS - 2 последовательных выбора даты
/// Для андроида [showRangeDatePicker()]
/// В случае если выбран промежутоу >14 дней, возвращается null
/// и показывается [SnackBar]
Future<Set<DateTime>?> showFilterDatesPicker(
  BuildContext context,
) async {
  final nowDate = DateTime.now();
  final firstDate = DateTime(nowDate.year, nowDate.month, nowDate.day + 1);
  // final lastDate = DateTime(nowDate.year, nowDate.month, nowDate.day + 14);
  Set<DateTime>? result;
  if (Platform.isAndroid) {
    final dateTimeRange = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: DateTime(
        nowDate.year + 1,
      ),
      // lastDate: lastDate,
    );
    if (dateTimeRange != null) {
      result = {dateTimeRange.start, dateTimeRange.end};
    }
  } else if (Platform.isIOS) {
    var firstDateFilter = firstDate;
    var secondDateFilter = DateTime(
      firstDateFilter.year,
      firstDateFilter.month,
      firstDateFilter.day + 1,
    );
    await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                firstDateFilter = value;
              },
              initialDateTime: firstDate,
              minimumDate: firstDate,
              // maximumDate: lastDate,
            ),
          ),
        );
      },
    );

    await showCupertinoModalPopup<DateTime>(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                secondDateFilter = value;
              },
              initialDateTime: DateTime(
                firstDateFilter.year,
                firstDateFilter.month,
                firstDateFilter.day + 1,
              ),
              minimumDate: DateTime(
                firstDateFilter.year,
                firstDateFilter.month,
                firstDateFilter.day + 1,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      result = {firstDateFilter, secondDateFilter};
    });
  }
  if (result != null) {
    final firstDateFilter = result!.first;
    final secondDateFilter = result!.last;
    final difference =
        (secondDateFilter.difference(firstDateFilter).inHours / 24).round();
    if (difference > 14) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Максимальный период может быть 14 дней'),
          ),
        );
      }
    }
  }
  return result;
}
