///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class EmojiMartTranslationsDe extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsDe _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Suche';
	@override String get search_no_results_1 => 'Oh nein!';
	@override String get search_no_results_2 => 'Dieses Emoji konnte nicht gefunden werden';
	@override String get pick => 'Wähle ein Emoji…';
	@override String get add_custom => 'Benutzerdefiniertes Emoji hinzufügen';
	@override late final _EmojiMartTranslationsCategoriesDe categories = _EmojiMartTranslationsCategoriesDe._(_root);
	@override String get skin_tone => 'Hautfarbe';
}

// Path: categories
class _EmojiMartTranslationsCategoriesDe extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesDe._(EmojiMartTranslationsDe root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Aktivität';
	@override String get custom => 'Benutzerdefiniert';
	@override String get flags => 'Flaggen';
	@override String get foods => 'Essen & Trinken';
	@override String get frequent => 'Häufig verwendet';
	@override String get nature => 'Tiere & Natur';
	@override String get objects => 'Objekte';
	@override String get people => 'Smileys & Menschen';
	@override String get places => 'Reisen & Orte';
	@override String get search => 'Suchergebnisse';
	@override String get symbols => 'Symbole';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsDe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Suche';
			case 'search_no_results_1': return 'Oh nein!';
			case 'search_no_results_2': return 'Dieses Emoji konnte nicht gefunden werden';
			case 'pick': return 'Wähle ein Emoji…';
			case 'add_custom': return 'Benutzerdefiniertes Emoji hinzufügen';
			case 'categories.activity': return 'Aktivität';
			case 'categories.custom': return 'Benutzerdefiniert';
			case 'categories.flags': return 'Flaggen';
			case 'categories.foods': return 'Essen & Trinken';
			case 'categories.frequent': return 'Häufig verwendet';
			case 'categories.nature': return 'Tiere & Natur';
			case 'categories.objects': return 'Objekte';
			case 'categories.people': return 'Smileys & Menschen';
			case 'categories.places': return 'Reisen & Orte';
			case 'categories.search': return 'Suchergebnisse';
			case 'categories.symbols': return 'Symbole';
			case 'skin_tone': return 'Hautfarbe';
			default: return null;
		}
	}
}

