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
class EmojiMartTranslationsEs extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Buscar';
	@override String get search_no_results_1 => '¡Oh no!';
	@override String get search_no_results_2 => 'Ese emoji no pudo ser encontrado';
	@override String get pick => 'Elige un emoji…';
	@override String get add_custom => 'Añadir emoji personalizado';
	@override late final _EmojiMartTranslationsCategoriesEs categories = _EmojiMartTranslationsCategoriesEs._(_root);
	@override String get skin_tone => 'Tono de piel';
}

// Path: categories
class _EmojiMartTranslationsCategoriesEs extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesEs._(EmojiMartTranslationsEs root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Actividad';
	@override String get custom => 'Personalizado';
	@override String get flags => 'Banderas';
	@override String get foods => 'Comida y Bebida';
	@override String get frequent => 'Usados frecuentemente';
	@override String get nature => 'Animales y Naturaleza';
	@override String get objects => 'Objetos';
	@override String get people => 'Emoticonos y Personas';
	@override String get places => 'Viajes y Lugares';
	@override String get search => 'Resultados de búsqueda';
	@override String get symbols => 'Símbolos';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Buscar';
			case 'search_no_results_1': return '¡Oh no!';
			case 'search_no_results_2': return 'Ese emoji no pudo ser encontrado';
			case 'pick': return 'Elige un emoji…';
			case 'add_custom': return 'Añadir emoji personalizado';
			case 'categories.activity': return 'Actividad';
			case 'categories.custom': return 'Personalizado';
			case 'categories.flags': return 'Banderas';
			case 'categories.foods': return 'Comida y Bebida';
			case 'categories.frequent': return 'Usados frecuentemente';
			case 'categories.nature': return 'Animales y Naturaleza';
			case 'categories.objects': return 'Objetos';
			case 'categories.people': return 'Emoticonos y Personas';
			case 'categories.places': return 'Viajes y Lugares';
			case 'categories.search': return 'Resultados de búsqueda';
			case 'categories.symbols': return 'Símbolos';
			case 'skin_tone': return 'Tono de piel';
			default: return null;
		}
	}
}

