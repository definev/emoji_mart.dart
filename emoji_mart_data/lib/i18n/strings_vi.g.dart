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
class EmojiMartTranslationsVi extends EmojiMartTranslations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [EmojiMartLocale.build] is preferred.
	EmojiMartTranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: EmojiMartLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<EmojiMartLocale, EmojiMartTranslations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final EmojiMartTranslationsVi _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Tìm kiếm';
	@override String get search_no_results_1 => 'Ôi không!';
	@override String get search_no_results_2 => 'Biểu tượng cảm xúc đó không thể tìm thấy';
	@override String get pick => 'Chọn một biểu tượng cảm xúc…';
	@override String get add_custom => 'Thêm biểu tượng cảm xúc tùy chỉnh';
	@override late final _EmojiMartTranslationsCategoriesVi categories = _EmojiMartTranslationsCategoriesVi._(_root);
	@override String get skin_tone => 'Tông màu da';
}

// Path: categories
class _EmojiMartTranslationsCategoriesVi extends EmojiMartTranslationsCategoriesEn {
	_EmojiMartTranslationsCategoriesVi._(EmojiMartTranslationsVi root) : this._root = root, super.internal(root);

	final EmojiMartTranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get activity => 'Hoạt động';
	@override String get custom => 'Tùy chỉnh';
	@override String get flags => 'Cờ';
	@override String get foods => 'Thực phẩm & Đồ uống';
	@override String get frequent => 'Sử dụng thường xuyên';
	@override String get nature => 'Động vật & Thiên nhiên';
	@override String get objects => 'Đối tượng';
	@override String get people => 'Biểu tượng cảm xúc & Con người';
	@override String get places => 'Du lịch & Địa điểm';
	@override String get search => 'Kết quả tìm kiếm';
	@override String get symbols => 'Biểu tượng';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on EmojiMartTranslationsVi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'search': return 'Tìm kiếm';
			case 'search_no_results_1': return 'Ôi không!';
			case 'search_no_results_2': return 'Biểu tượng cảm xúc đó không thể tìm thấy';
			case 'pick': return 'Chọn một biểu tượng cảm xúc…';
			case 'add_custom': return 'Thêm biểu tượng cảm xúc tùy chỉnh';
			case 'categories.activity': return 'Hoạt động';
			case 'categories.custom': return 'Tùy chỉnh';
			case 'categories.flags': return 'Cờ';
			case 'categories.foods': return 'Thực phẩm & Đồ uống';
			case 'categories.frequent': return 'Sử dụng thường xuyên';
			case 'categories.nature': return 'Động vật & Thiên nhiên';
			case 'categories.objects': return 'Đối tượng';
			case 'categories.people': return 'Biểu tượng cảm xúc & Con người';
			case 'categories.places': return 'Du lịch & Địa điểm';
			case 'categories.search': return 'Kết quả tìm kiếm';
			case 'categories.symbols': return 'Biểu tượng';
			case 'skin_tone': return 'Tông màu da';
			default: return null;
		}
	}
}

