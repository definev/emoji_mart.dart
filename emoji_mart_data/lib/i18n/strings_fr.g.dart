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
class EmojiMartTranslationsFr extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Recherche';
	@override String get search_no_results_1 => 'Oh non !';
	@override String get search_no_results_2 => 'Cet emoji n\'a pas pu être trouvé';
	@override String get pick => 'Choisissez un emoji…';
	@override String get add_custom => 'Ajouter un emoji personnalisé';
	@override late final _EmojiMartTranslationsCategoriesFr categories = _EmojiMartTranslationsCategoriesFr._(_root);
	@override String get skin_tone => 'Teinte de peau';
}

// Path: categories
class _EmojiMartTranslationsCategoriesFr extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesFr._(EmojiMartTranslationsFr root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Activité';
	@override String get custom => 'Personnalisé';
	@override String get flags => 'Drapeaux';
	@override String get foods => 'Nourriture & Boissons';
	@override String get frequent => 'Utilisé fréquemment';
	@override String get nature => 'Animaux & Nature';
	@override String get objects => 'Objets';
	@override String get people => 'Émoticônes & Personnes';
	@override String get places => 'Voyages & Lieux';
	@override String get search => 'Résultats de recherche';
	@override String get symbols => 'Symboles';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Recherche';
			case 'search_no_results_1': return 'Oh non !';
			case 'search_no_results_2': return 'Cet emoji n\'a pas pu être trouvé';
			case 'pick': return 'Choisissez un emoji…';
			case 'add_custom': return 'Ajouter un emoji personnalisé';
			case 'categories.activity': return 'Activité';
			case 'categories.custom': return 'Personnalisé';
			case 'categories.flags': return 'Drapeaux';
			case 'categories.foods': return 'Nourriture & Boissons';
			case 'categories.frequent': return 'Utilisé fréquemment';
			case 'categories.nature': return 'Animaux & Nature';
			case 'categories.objects': return 'Objets';
			case 'categories.people': return 'Émoticônes & Personnes';
			case 'categories.places': return 'Voyages & Lieux';
			case 'categories.search': return 'Résultats de recherche';
			case 'categories.symbols': return 'Symboles';
			case 'skin_tone': return 'Teinte de peau';
			default: return null;
		}
	}
}

