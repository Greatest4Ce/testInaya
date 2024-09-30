/// Generated file. Do not edit.
///
/// Original: lib/core/i18n
/// To regenerate, run: `dart run slang`

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ru;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ru(languageCode: 'ru', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	Map<String, String> get houseTypeMap => {
		'aFrame': 'A-Frame',
		'safari': 'Сафари',
		'recreationCenter': 'База отдыха',
		'barnhouse': 'Барн хаусы',
		'modulHouse': 'Модульные дома',
		'sphere': 'Сферы',
		'shale': 'Шале',
		'barrelHouse': 'Дома бочки',
	};
	Map<String, String> get facilitiesMap => {
		'mangal': 'Мангал',
		'parking': 'Паркинг',
		'tv': 'ТВ',
		'conditioner': 'Кондиционер',
		'kitchen': 'Кухня',
		'wifi': 'Wi-Fi',
		'talkingHouse': 'Беседка',
	};
	Map<String, String> get funsMap => {
		'lake': 'Водоём',
		'jakuzi': 'Джакузи',
		'billiard': 'Бильярд',
		'furako': 'Фурако',
		'pool': 'Бассейн',
		'supboard': 'Sup board',
		'horseSport': 'Конные прогулки',
		'bicycles': 'Велосипеды',
	};
	Map<String, String> get sleepPlaceMap => {
		'queenBed': 'Двуспальная кровать',
		'sofa': 'Диван',
		'babyPlace': 'Место для младенца',
	};
	late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	late final _TranslationsDetailRu detail = _TranslationsDetailRu._(_root);
	late final _TranslationsFiltersRu filters = _TranslationsFiltersRu._(_root);
}

// Path: home
class _TranslationsHomeRu {
	_TranslationsHomeRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Поиск';
	String get all => 'Все';
	String get km => 'км';
	String get views => 'просм';
	String get guests => 'гостей';
	String get from => 'от';
	String get ruble => '₽';
	String get onMap => 'На карте';
}

// Path: detail
class _TranslationsDetailRu {
	_TranslationsDetailRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get call => 'Позвонить';
	String get message => 'Написать';
	String get share => 'Поделиться';
	String get more => 'Подробнее';
	String address({required Object address, required Object count}) => '${address} • ${count} км';
	String get from => 'от';
	String get ruble => '₽';
	String get book => 'Забронировать';
	String get sleepPlaces => 'Спальные места';
}

// Path: filters
class _TranslationsFiltersRu {
	_TranslationsFiltersRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String count({required Object n}) => '(${n})';
	String get filters => 'Фильтры';
	String get dates => 'Даты поездки';
	String get nearest => 'Ближайшие';
	String get priceRangeTitle => 'Ценовой диапазон';
	String priceRange({required Object start, required Object end}) => '${start} - ${end} ';
	String averagePriceForDay({required Object price}) => 'Средняя цена за сутки ${price}';
	String get distance => 'Отдаленность';
	String km({required Object km}) => '${km} км';
	String get houses => 'Дома';
	String get placeCount => 'Количество мест';
	String get placeForBaby => 'Место для младенца';
	String get facilities => 'Удобства';
	String get funs => 'Развлечения';
	String get clear => 'Очистить';
	String showVariants({required Object n}) => 'Показать ${n} вариантов';
}
