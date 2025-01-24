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
class EmojiMartTranslationsKo extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsKo _root = this; // ignore: unused_field

	// Translations
	@override String get search => '검색';
	@override String get search_no_results_1 => '오, 아니야!';
	@override String get search_no_results_2 => '해당 이모지를 찾을 수 없습니다';
	@override String get pick => '이모지 선택하기…';
	@override String get add_custom => '커스텀 이모지 추가';
	@override late final _EmojiMartTranslationsCategoriesKo categories = _EmojiMartTranslationsCategoriesKo._(_root);
	@override String get skin_tone => '피부 톤';
}

// Path: categories
class _EmojiMartTranslationsCategoriesKo extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesKo._(EmojiMartTranslationsKo root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get activity => '활동';
	@override String get custom => '커스텀';
	@override String get flags => '국기';
	@override String get foods => '음식 & 음료';
	@override String get frequent => '자주 사용함';
	@override String get nature => '동물 & 자연';
	@override String get objects => '사물';
	@override String get people => '스마일리 & 사람들';
	@override String get places => '여행 & 장소';
	@override String get search => '검색 결과';
	@override String get symbols => '기호';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsKo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return '검색';
			case 'search_no_results_1': return '오, 아니야!';
			case 'search_no_results_2': return '해당 이모지를 찾을 수 없습니다';
			case 'pick': return '이모지 선택하기…';
			case 'add_custom': return '커스텀 이모지 추가';
			case 'categories.activity': return '활동';
			case 'categories.custom': return '커스텀';
			case 'categories.flags': return '국기';
			case 'categories.foods': return '음식 & 음료';
			case 'categories.frequent': return '자주 사용함';
			case 'categories.nature': return '동물 & 자연';
			case 'categories.objects': return '사물';
			case 'categories.people': return '스마일리 & 사람들';
			case 'categories.places': return '여행 & 장소';
			case 'categories.search': return '검색 결과';
			case 'categories.symbols': return '기호';
			case 'skin_tone': return '피부 톤';
			default: return null;
		}
	}
}

