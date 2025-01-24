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
class EmojiMartTranslationsAr extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsAr _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'بحث';
	@override String get search_no_results_1 => 'أوه لا!';
	@override String get search_no_results_2 => 'لم يمكن العثور على هذا الإيموجي';
	@override String get pick => 'اختر إيموجي…';
	@override String get add_custom => 'أضف إيموجي مخصص';
	@override late final _EmojiMartTranslationsCategoriesAr categories = _EmojiMartTranslationsCategoriesAr._(_root);
	@override String get skin_tone => 'لون البشرة';
}

// Path: categories
class _EmojiMartTranslationsCategoriesAr extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesAr._(EmojiMartTranslationsAr root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get activity => 'نشاط';
	@override String get custom => 'مخصص';
	@override String get flags => 'رايات';
	@override String get foods => 'طعام وشراب';
	@override String get frequent => 'المستخدم بشكل متكرر';
	@override String get nature => 'حيوانات وطبيعة';
	@override String get objects => 'أشياء';
	@override String get people => 'وجه مبتسم وأشخاص';
	@override String get places => 'سفر وأماكن';
	@override String get search => 'نتائج البحث';
	@override String get symbols => 'رموز';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'بحث';
			case 'search_no_results_1': return 'أوه لا!';
			case 'search_no_results_2': return 'لم يمكن العثور على هذا الإيموجي';
			case 'pick': return 'اختر إيموجي…';
			case 'add_custom': return 'أضف إيموجي مخصص';
			case 'categories.activity': return 'نشاط';
			case 'categories.custom': return 'مخصص';
			case 'categories.flags': return 'رايات';
			case 'categories.foods': return 'طعام وشراب';
			case 'categories.frequent': return 'المستخدم بشكل متكرر';
			case 'categories.nature': return 'حيوانات وطبيعة';
			case 'categories.objects': return 'أشياء';
			case 'categories.people': return 'وجه مبتسم وأشخاص';
			case 'categories.places': return 'سفر وأماكن';
			case 'categories.search': return 'نتائج البحث';
			case 'categories.symbols': return 'رموز';
			case 'skin_tone': return 'لون البشرة';
			default: return null;
		}
	}
}

