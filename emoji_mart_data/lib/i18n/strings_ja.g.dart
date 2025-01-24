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
class EmojiMartTranslationsJa extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsJa _root = this; // ignore: unused_field

	// Translations
	@override String get search => '検索';
	@override String get search_no_results_1 => 'おっと！';
	@override String get search_no_results_2 => 'その絵文字は見つかりませんでした';
	@override String get pick => '絵文字を選択…';
	@override String get add_custom => 'カスタム絵文字を追加';
	@override late final _EmojiMartTranslationsCategoriesJa categories = _EmojiMartTranslationsCategoriesJa._(_root);
	@override String get skin_tone => '肌の色';
}

// Path: categories
class _EmojiMartTranslationsCategoriesJa extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesJa._(EmojiMartTranslationsJa root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get activity => 'アクティビティ';
	@override String get custom => 'カスタム';
	@override String get flags => '国旗';
	@override String get foods => '食べ物 & 飲み物';
	@override String get frequent => 'よく使われる';
	@override String get nature => '動物 & 自然';
	@override String get objects => 'オブジェクト';
	@override String get people => 'スマイリー & 人々';
	@override String get places => '旅行 & 場所';
	@override String get search => '検索結果';
	@override String get symbols => 'シンボル';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return '検索';
			case 'search_no_results_1': return 'おっと！';
			case 'search_no_results_2': return 'その絵文字は見つかりませんでした';
			case 'pick': return '絵文字を選択…';
			case 'add_custom': return 'カスタム絵文字を追加';
			case 'categories.activity': return 'アクティビティ';
			case 'categories.custom': return 'カスタム';
			case 'categories.flags': return '国旗';
			case 'categories.foods': return '食べ物 & 飲み物';
			case 'categories.frequent': return 'よく使われる';
			case 'categories.nature': return '動物 & 自然';
			case 'categories.objects': return 'オブジェクト';
			case 'categories.people': return 'スマイリー & 人々';
			case 'categories.places': return '旅行 & 場所';
			case 'categories.search': return '検索結果';
			case 'categories.symbols': return 'シンボル';
			case 'skin_tone': return '肌の色';
			default: return null;
		}
	}
}

