import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testinaya/core/router/router.dart';
import 'package:testinaya/core/styles/themes/my_theme.dart';
import 'package:testinaya/generated/i18n/translations.g.dart';

final _appRouter = AppRouter();

/// Тестовое приложение
class MyApp extends StatelessWidget {
  /// Стандартный конструктор
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: MyTheme.light().data,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        themeMode: ThemeMode.light,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
