///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef EmojiMartTranslationsEn = EmojiMartTranslations; // ignore: unused_element
class EmojiMartTranslations implements BaseTranslations<EmojiMartLocale, EmojiMartTranslations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final emt = EmojiMartTranslations.of(context);
	static EmojiMartTranslations of(BuildContext context) => InheritedLocaleData.of<EmojiMartLocale, EmojiMartTranslations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final EmojiMartTranslations _root = this; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get search_no_results_1 => 'Oh no!';
	String get search_no_results_2 => 'That emoji couldn\'t be found';
	String get pick => 'Pick an emoji…';
	String get add_custom => 'Add custom emoji';
	late final EmojiMartTranslationsCategoriesEn categories = EmojiMartTranslationsCategoriesEn.internal(_root);
	String get skin_tone => 'Skin tone';
}

// Path: categories
class EmojiMartTranslationsCategoriesEn {
	EmojiMartTranslationsCategoriesEn.internal(this._root);

	final EmojiMartTranslations _root; // ignore: unused_field

	// Translations
	String get activity => 'Activity';
	String get custom => 'Custom';
	String get flags => 'Flags';
	String get foods => 'Food & Drink';
	String get frequent => 'Frequently used';
	String get nature => 'Animals & Nature';
	String get objects => 'Objects';
	String get people => 'Smileys & People';
	String get places => 'Travel & Places';
	String get search => 'Search Results';
	String get symbols => 'Symbols';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Search';
			case 'search_no_results_1': return 'Oh no!';
			case 'search_no_results_2': return 'That emoji couldn\'t be found';
			case 'pick': return 'Pick an emoji…';
			case 'add_custom': return 'Add custom emoji';
			case 'categories.activity': return 'Activity';
			case 'categories.custom': return 'Custom';
			case 'categories.flags': return 'Flags';
			case 'categories.foods': return 'Food & Drink';
			case 'categories.frequent': return 'Frequently used';
			case 'categories.nature': return 'Animals & Nature';
			case 'categories.objects': return 'Objects';
			case 'categories.people': return 'Smileys & People';
			case 'categories.places': return 'Travel & Places';
			case 'categories.search': return 'Search Results';
			case 'categories.symbols': return 'Symbols';
			case 'skin_tone': return 'Skin tone';
			default: return null;
		}
	}
}

