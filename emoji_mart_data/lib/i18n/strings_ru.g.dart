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
class EmojiMartTranslationsRu extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Поиск';
	@override String get search_no_results_1 => 'О нет!';
	@override String get search_no_results_2 => 'Этот эмодзи не найден';
	@override String get pick => 'Выберите эмодзи…';
	@override String get add_custom => 'Добавить пользовательский эмодзи';
	@override late final _EmojiMartTranslationsCategoriesRu categories = _EmojiMartTranslationsCategoriesRu._(_root);
	@override String get skin_tone => 'Оттенок кожи';
}

// Path: categories
class _EmojiMartTranslationsCategoriesRu extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesRu._(EmojiMartTranslationsRu root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Активность';
	@override String get custom => 'Пользовательский';
	@override String get flags => 'Флаги';
	@override String get foods => 'Еда и напитки';
	@override String get frequent => 'Часто используемые';
	@override String get nature => 'Животные и природа';
	@override String get objects => 'Объекты';
	@override String get people => 'Смайлы и люди';
	@override String get places => 'Путешествия и места';
	@override String get search => 'Результаты поиска';
	@override String get symbols => 'Символы';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Поиск';
			case 'search_no_results_1': return 'О нет!';
			case 'search_no_results_2': return 'Этот эмодзи не найден';
			case 'pick': return 'Выберите эмодзи…';
			case 'add_custom': return 'Добавить пользовательский эмодзи';
			case 'categories.activity': return 'Активность';
			case 'categories.custom': return 'Пользовательский';
			case 'categories.flags': return 'Флаги';
			case 'categories.foods': return 'Еда и напитки';
			case 'categories.frequent': return 'Часто используемые';
			case 'categories.nature': return 'Животные и природа';
			case 'categories.objects': return 'Объекты';
			case 'categories.people': return 'Смайлы и люди';
			case 'categories.places': return 'Путешествия и места';
			case 'categories.search': return 'Результаты поиска';
			case 'categories.symbols': return 'Символы';
			case 'skin_tone': return 'Оттенок кожи';
			default: return null;
		}
	}
}

