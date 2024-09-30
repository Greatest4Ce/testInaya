import 'package:flutter/material.dart';
import 'package:testinaya/core/app.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

void main() {
  runApp(
    TranslationProvider(
      child: const MyApp(),
    ),
  );
}
