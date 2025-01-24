/// Generated file. Do not edit.
///
/// Source: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 11
/// Strings: 187 (17 per locale)
///
/// Built on 2025-01-24 at 18:15 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'strings_ar.g.dart' deferred as l_ar;
import 'strings_de.g.dart' deferred as l_de;
import 'strings_es.g.dart' deferred as l_es;
import 'strings_fr.g.dart' deferred as l_fr;
import 'strings_it.g.dart' deferred as l_it;
import 'strings_ja.g.dart' deferred as l_ja;
import 'strings_ko.g.dart' deferred as l_ko;
import 'strings_pt.g.dart' deferred as l_pt;
import 'strings_ru.g.dart' deferred as l_ru;
import 'strings_vi.g.dart' deferred as l_vi;
part 'strings_en.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(EmojiMartLocale.en) // set locale
/// - Locale locale = EmojiMartLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == EmojiMartLocale.en) // locale check
enum EmojiMartLocale with BaseAppLocale<EmojiMartLocale, EmojiMartTranslations> {
	en(languageCode: 'en'),
	ar(languageCode: 'ar'),
	de(languageCode: 'de'),
	es(languageCode: 'es'),
	fr(languageCode: 'fr'),
	it(languageCode: 'it'),
	ja(languageCode: 'ja'),
	ko(languageCode: 'ko'),
	pt(languageCode: 'pt'),
	ru(languageCode: 'ru'),
	vi(languageCode: 'vi');

	const EmojiMartLocale({
		required this.languageCode,
		this.scriptCode, // ignore: unused_element
		this.countryCode, // ignore: unused_element
	});

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;

	@override
	Future<EmojiMartTranslations> build({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) async {
		switch (this) {
			case EmojiMartLocale.en:
				return EmojiMartTranslationsEn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ar:
				await l_ar.loadLibrary();
				return l_ar.EmojiMartTranslationsAr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.de:
				await l_de.loadLibrary();
				return l_de.EmojiMartTranslationsDe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.es:
				await l_es.loadLibrary();
				return l_es.EmojiMartTranslationsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.fr:
				await l_fr.loadLibrary();
				return l_fr.EmojiMartTranslationsFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.it:
				await l_it.loadLibrary();
				return l_it.EmojiMartTranslationsIt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ja:
				await l_ja.loadLibrary();
				return l_ja.EmojiMartTranslationsJa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ko:
				await l_ko.loadLibrary();
				return l_ko.EmojiMartTranslationsKo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.pt:
				await l_pt.loadLibrary();
				return l_pt.EmojiMartTranslationsPt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ru:
				await l_ru.loadLibrary();
				return l_ru.EmojiMartTranslationsRu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.vi:
				await l_vi.loadLibrary();
				return l_vi.EmojiMartTranslationsVi(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	@override
	EmojiMartTranslations buildSync({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) {
		switch (this) {
			case EmojiMartLocale.en:
				return EmojiMartTranslationsEn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ar:
				return l_ar.EmojiMartTranslationsAr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.de:
				return l_de.EmojiMartTranslationsDe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.es:
				return l_es.EmojiMartTranslationsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.fr:
				return l_fr.EmojiMartTranslationsFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.it:
				return l_it.EmojiMartTranslationsIt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ja:
				return l_ja.EmojiMartTranslationsJa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ko:
				return l_ko.EmojiMartTranslationsKo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.pt:
				return l_pt.EmojiMartTranslationsPt(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.ru:
				return l_ru.EmojiMartTranslationsRu(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case EmojiMartLocale.vi:
				return l_vi.EmojiMartTranslationsVi(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	/// Gets current instance managed by [LocaleSettings].
	EmojiMartTranslations get translations => LocaleSettings.instance.getTranslations(this);
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of emt).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = emt.someKey.anotherKey;
/// String b = emt['someKey.anotherKey']; // Only for edge cases!
EmojiMartTranslations get emt => LocaleSettings.instance.currentTranslations;

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
/// final emt = EmojiMartTranslations.of(context); // Get emt variable.
/// String a = emt.someKey.anotherKey; // Use emt variable.
/// String b = emt['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<EmojiMartLocale, EmojiMartTranslations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<EmojiMartLocale, EmojiMartTranslations> of(BuildContext context) => InheritedLocaleData.of<EmojiMartLocale, EmojiMartTranslations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.emt.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	EmojiMartTranslations get emt => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<EmojiMartLocale, EmojiMartTranslations> {
	LocaleSettings._() : super(
		utils: AppLocaleUtils.instance,
		lazy: true,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static EmojiMartLocale get currentLocale => instance.currentLocale;
	static Stream<EmojiMartLocale> getLocaleStream() => instance.getLocaleStream();
	static Future<EmojiMartLocale> setLocale(EmojiMartLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<EmojiMartLocale> setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<EmojiMartLocale> useDeviceLocale() => instance.useDeviceLocale();
	static Future<void> setPluralResolver({String? language, EmojiMartLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);

	// synchronous versions
	static EmojiMartLocale setLocaleSync(EmojiMartLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocaleSync(locale, listenToDeviceLocale: listenToDeviceLocale);
	static EmojiMartLocale setLocaleRawSync(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRawSync(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static EmojiMartLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
	static void setPluralResolverSync({String? language, EmojiMartLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolverSync(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<EmojiMartLocale, EmojiMartTranslations> {
	AppLocaleUtils._() : super(
		baseLocale: EmojiMartLocale.en,
		locales: EmojiMartLocale.values,
	);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static EmojiMartLocale parse(String rawLocale) => instance.parse(rawLocale);
	static EmojiMartLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static EmojiMartLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
