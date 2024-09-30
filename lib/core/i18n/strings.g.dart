/// Generated file. Do not edit.
///
/// Original: lib/core/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 59
///
/// Built on 2024-09-27 at 10:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

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
/// String b = t['someKey.anotherKey']; // Only for edge cases!
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
/// String b = t['someKey.anotherKey']; // Only for edge cases!
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
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsHouseTypeMapEn houseTypeMap = _StringsHouseTypeMapEn._(_root);
	late final _StringsFacilitiesMapEn facilitiesMap = _StringsFacilitiesMapEn._(_root);
	late final _StringsFunsMapEn funsMap = _StringsFunsMapEn._(_root);
	late final _StringsSleepPlaceMapEn sleepPlaceMap = _StringsSleepPlaceMapEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsDetailEn detail = _StringsDetailEn._(_root);
	late final _StringsFiltersEn filters = _StringsFiltersEn._(_root);
}

// Path: houseTypeMap
class _StringsHouseTypeMapEn {
	_StringsHouseTypeMapEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get aFrame => 'A-Frame';
	String get safari => 'Сафари';
	String get recreationCenter => 'База отдыха';
	String get barnhouse => 'Барн хаусы';
	String get modulHouse => 'Модульные дома';
	String get sphere => 'Сферы';
	String get shale => 'Шале';
	String get barrelHouse => 'Дома бочки';
}

// Path: facilitiesMap
class _StringsFacilitiesMapEn {
	_StringsFacilitiesMapEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get mangal => 'Мангал';
	String get parking => 'Паркинг';
	String get tv => 'ТВ';
	String get conditioner => 'Кондиционер';
	String get kitchen => 'Кухня';
	String get wifi => 'Wi-Fi';
	String get talkingHouse => 'Беседка';
}

// Path: funsMap
class _StringsFunsMapEn {
	_StringsFunsMapEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get lake => 'Водоём';
	String get jakuzi => 'Джакузи';
	String get billiard => 'Бильярд';
	String get furako => 'Фурако';
	String get pool => 'Бассейн';
	String get supboard => 'Sup board';
	String get horseSport => 'Конные прогулки';
	String get bicycles => 'Велосипеды';
}

// Path: sleepPlaceMap
class _StringsSleepPlaceMapEn {
	_StringsSleepPlaceMapEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get queenBed => 'Двуспальная кровать';
	String get sofa => 'Диван';
	String get babyPlace => 'Место для младенца';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

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
class _StringsDetailEn {
	_StringsDetailEn._(this._root);

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
class _StringsFiltersEn {
	_StringsFiltersEn._(this._root);

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'houseTypeMap.aFrame': return 'A-Frame';
			case 'houseTypeMap.safari': return 'Сафари';
			case 'houseTypeMap.recreationCenter': return 'База отдыха';
			case 'houseTypeMap.barnhouse': return 'Барн хаусы';
			case 'houseTypeMap.modulHouse': return 'Модульные дома';
			case 'houseTypeMap.sphere': return 'Сферы';
			case 'houseTypeMap.shale': return 'Шале';
			case 'houseTypeMap.barrelHouse': return 'Дома бочки';
			case 'facilitiesMap.mangal': return 'Мангал';
			case 'facilitiesMap.parking': return 'Паркинг';
			case 'facilitiesMap.tv': return 'ТВ';
			case 'facilitiesMap.conditioner': return 'Кондиционер';
			case 'facilitiesMap.kitchen': return 'Кухня';
			case 'facilitiesMap.wifi': return 'Wi-Fi';
			case 'facilitiesMap.talkingHouse': return 'Беседка';
			case 'funsMap.lake': return 'Водоём';
			case 'funsMap.jakuzi': return 'Джакузи';
			case 'funsMap.billiard': return 'Бильярд';
			case 'funsMap.furako': return 'Фурако';
			case 'funsMap.pool': return 'Бассейн';
			case 'funsMap.supboard': return 'Sup board';
			case 'funsMap.horseSport': return 'Конные прогулки';
			case 'funsMap.bicycles': return 'Велосипеды';
			case 'sleepPlaceMap.queenBed': return 'Двуспальная кровать';
			case 'sleepPlaceMap.sofa': return 'Диван';
			case 'sleepPlaceMap.babyPlace': return 'Место для младенца';
			case 'home.search': return 'Поиск';
			case 'home.all': return 'Все';
			case 'home.km': return 'км';
			case 'home.views': return 'просм';
			case 'home.guests': return 'гостей';
			case 'home.from': return 'от';
			case 'home.ruble': return '₽';
			case 'home.onMap': return 'На карте';
			case 'detail.call': return 'Позвонить';
			case 'detail.message': return 'Написать';
			case 'detail.share': return 'Поделиться';
			case 'detail.more': return 'Подробнее';
			case 'detail.address': return ({required Object address, required Object count}) => '${address} • ${count} км';
			case 'detail.from': return 'от';
			case 'detail.ruble': return '₽';
			case 'detail.book': return 'Забронировать';
			case 'detail.sleepPlaces': return 'Спальные места';
			case 'filters.count': return ({required Object n}) => '(${n})';
			case 'filters.filters': return 'Фильтры';
			case 'filters.dates': return 'Даты поездки';
			case 'filters.nearest': return 'Ближайшие';
			case 'filters.priceRangeTitle': return 'Ценовой диапазон';
			case 'filters.priceRange': return ({required Object start, required Object end}) => '${start} - ${end} ';
			case 'filters.averagePriceForDay': return ({required Object price}) => 'Средняя цена за сутки ${price}';
			case 'filters.distance': return 'Отдаленность';
			case 'filters.km': return ({required Object km}) => '${km} км';
			case 'filters.houses': return 'Дома';
			case 'filters.placeCount': return 'Количество мест';
			case 'filters.placeForBaby': return 'Место для младенца';
			case 'filters.facilities': return 'Удобства';
			case 'filters.funs': return 'Развлечения';
			case 'filters.clear': return 'Очистить';
			case 'filters.showVariants': return ({required Object n}) => 'Показать ${n} вариантов';
			default: return null;
		}
	}
}
