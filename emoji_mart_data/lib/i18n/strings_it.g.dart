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
class EmojiMartTranslationsIt extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsIt _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Cerca';
	@override String get search_no_results_1 => 'Oh no!';
	@override String get search_no_results_2 => 'Quell\'emoji non è stata trovata';
	@override String get pick => 'Scegli un\'emoji…';
	@override String get add_custom => 'Aggiungi emoji personalizzata';
	@override late final _EmojiMartTranslationsCategoriesIt categories = _EmojiMartTranslationsCategoriesIt._(_root);
	@override String get skin_tone => 'Tonalità della pelle';
}

// Path: categories
class _EmojiMartTranslationsCategoriesIt extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesIt._(EmojiMartTranslationsIt root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Attività';
	@override String get custom => 'Personalizzato';
	@override String get flags => 'Bandierine';
	@override String get foods => 'Cibo e bevande';
	@override String get frequent => 'Usato di frequente';
	@override String get nature => 'Animali e natura';
	@override String get objects => 'Oggetti';
	@override String get people => 'Faccine e persone';
	@override String get places => 'Viaggi e luoghi';
	@override String get search => 'Risultati della ricerca';
	@override String get symbols => 'Simboli';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsIt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Cerca';
			case 'search_no_results_1': return 'Oh no!';
			case 'search_no_results_2': return 'Quell\'emoji non è stata trovata';
			case 'pick': return 'Scegli un\'emoji…';
			case 'add_custom': return 'Aggiungi emoji personalizzata';
			case 'categories.activity': return 'Attività';
			case 'categories.custom': return 'Personalizzato';
			case 'categories.flags': return 'Bandierine';
			case 'categories.foods': return 'Cibo e bevande';
			case 'categories.frequent': return 'Usato di frequente';
			case 'categories.nature': return 'Animali e natura';
			case 'categories.objects': return 'Oggetti';
			case 'categories.people': return 'Faccine e persone';
			case 'categories.places': return 'Viaggi e luoghi';
			case 'categories.search': return 'Risultati della ricerca';
			case 'categories.symbols': return 'Simboli';
			case 'skin_tone': return 'Tonalità della pelle';
			default: return null;
		}
	}
}

