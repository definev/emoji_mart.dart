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
class EmojiMartTranslationsPt extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsPt _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Pesquisar';
	@override String get search_no_results_1 => 'Oh não!';
	@override String get search_no_results_2 => 'Esse emoji não pôde ser encontrado';
	@override String get pick => 'Escolha um emoji…';
	@override String get add_custom => 'Adicionar emoji personalizado';
	@override late final _EmojiMartTranslationsCategoriesPt categories = _EmojiMartTranslationsCategoriesPt._(_root);
	@override String get skin_tone => 'Tom de pele';
}

// Path: categories
class _EmojiMartTranslationsCategoriesPt extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesPt._(EmojiMartTranslationsPt root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Atividade';
	@override String get custom => 'Personalizado';
	@override String get flags => 'Bandeiras';
	@override String get foods => 'Comida & Bebida';
	@override String get frequent => 'Usado com frequência';
	@override String get nature => 'Animais & Natureza';
	@override String get objects => 'Objetos';
	@override String get people => 'Sorrisos & Pessoas';
	@override String get places => 'Viagens & Lugares';
	@override String get search => 'Resultados da Pesquisa';
	@override String get symbols => 'Símbolos';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Pesquisar';
			case 'search_no_results_1': return 'Oh não!';
			case 'search_no_results_2': return 'Esse emoji não pôde ser encontrado';
			case 'pick': return 'Escolha um emoji…';
			case 'add_custom': return 'Adicionar emoji personalizado';
			case 'categories.activity': return 'Atividade';
			case 'categories.custom': return 'Personalizado';
			case 'categories.flags': return 'Bandeiras';
			case 'categories.foods': return 'Comida & Bebida';
			case 'categories.frequent': return 'Usado com frequência';
			case 'categories.nature': return 'Animais & Natureza';
			case 'categories.objects': return 'Objetos';
			case 'categories.people': return 'Sorrisos & Pessoas';
			case 'categories.places': return 'Viagens & Lugares';
			case 'categories.search': return 'Resultados da Pesquisa';
			case 'categories.symbols': return 'Símbolos';
			case 'skin_tone': return 'Tom de pele';
			default: return null;
		}
	}
}

