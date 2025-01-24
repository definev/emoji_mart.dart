import 'package:flutter/foundation.dart';

class EmojiMartData {
  const EmojiMartData({
    required this.categories,
    required this.emojis,
    required this.aliases,
    required this.sheet,
  });

  final List<Category> categories;
  final Map<String, Emoji> emojis;
  final Map<String, String> aliases;
  final Sheet sheet;

  static EmojiMartData fromJson(Map<String, dynamic> json) {
    final categories = (json['categories'] as List)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList();
    final emojis = (json['emojis'] as Map<String, dynamic>).map(
      (key, value) =>
          MapEntry(key, Emoji.fromJson(value as Map<String, dynamic>)),
    );
    final aliases = (json['aliases'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(key, value as String),
    );
    final sheet = Sheet.fromJson(json['sheet'] as Map<String, dynamic>);
    return EmojiMartData(
      categories: categories,
      emojis: emojis,
      aliases: aliases,
      sheet: sheet,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
      'emojis': emojis.map((key, value) => MapEntry(key, value.toJson())),
      'aliases': aliases,
      'sheet': sheet.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmojiMartData &&
        listEquals(other.categories, categories) &&
        mapEquals(other.emojis, emojis) &&
        mapEquals(other.aliases, aliases) &&
        other.sheet == sheet;
  }

  @override
  int get hashCode {
    return categories.hashCode ^
        emojis.hashCode ^
        aliases.hashCode ^
        sheet.hashCode;
  }

  @override
  String toString() {
    return 'EmojiMartData(categories: $categories, emojis: $emojis, aliases: $aliases, sheet: $sheet)';
  }

  EmojiMartData copyWith({
    List<Category>? categories,
    Map<String, Emoji>? emojis,
    Map<String, String>? aliases,
    Sheet? sheet,
  }) {
    return EmojiMartData(
      categories: categories ?? this.categories,
      emojis: emojis ?? this.emojis,
      aliases: aliases ?? this.aliases,
      sheet: sheet ?? this.sheet,
    );
  }
}

class Category {
  final String id;
  final List<String> emojis;

  Category({
    required this.id,
    required this.emojis,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      emojis: (json['emojis'] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emojis': emojis,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        listEquals(other.emojis, emojis);
  }

  @override
  int get hashCode {
    return id.hashCode ^ emojis.hashCode;
  }

  @override
  String toString() => 'Category(id: $id, emojis: $emojis)';

  Category copyWith({
    String? id,
    List<String>? emojis,
  }) {
    return Category(
      id: id ?? this.id,
      emojis: emojis ?? this.emojis,
    );
  }
}

class Emoji {
  final String id;
  final String name;
  final List<String> keywords;
  final List<Skin> skins;
  final double version;

  Emoji({
    required this.id,
    required this.name,
    required this.keywords,
    required this.skins,
    required this.version,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      id: json['id'] as String,
      name: json['name'] as String,
      keywords: (json['keywords'] as List).map((e) => e as String).toList(),
      skins: (json['skins'] as List)
          .map((e) => Skin.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: (json['version'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'keywords': keywords,
      'skins': skins.map((e) => e.toJson()).toList(),
      'version': version,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Emoji &&
        other.id == id &&
        other.name == name &&
        listEquals(other.keywords, keywords) &&
        listEquals(other.skins, skins) &&
        other.version == version;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        keywords.hashCode ^
        skins.hashCode ^
        version.hashCode;
  }

  @override
  String toString() {
    return 'Emoji(id: $id, name: $name, keywords: $keywords, skins: $skins, version: $version)';
  }

  Emoji copyWith({
    String? id,
    String? name,
    List<String>? keywords,
    List<Skin>? skins,
    double? version,
  }) {
    return Emoji(
      id: id ?? this.id,
      name: name ?? this.name,
      keywords: keywords ?? this.keywords,
      skins: skins ?? this.skins,
      version: version ?? this.version,
    );
  }
}

class Skin {
  final String unified;
  final String native;
  final int? x;
  final int? y;

  Skin({
    required this.unified,
    required this.native,
    required this.x,
    required this.y,
  });

  factory Skin.fromJson(Map<String, dynamic> json) {
    return Skin(
      unified: json['unified'] as String,
      native: json['native'] as String,
      x: json['x'] as int?,
      y: json['y'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unified': unified,
      'native': native,
      'x': x,
      'y': y,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Skin &&
        other.unified == unified &&
        other.native == native &&
        other.x == x &&
        other.y == y;
  }

  @override
  int get hashCode {
    return unified.hashCode ^ native.hashCode ^ x.hashCode ^ y.hashCode;
  }

  @override
  String toString() {
    return 'Skin(unified: $unified, native: $native, x: $x, y: $y)';
  }

  Skin copyWith({
    String? unified,
    String? native,
    int? x,
    int? y,
  }) {
    return Skin(
      unified: unified ?? this.unified,
      native: native ?? this.native,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }
}

class Sheet {
  final int cols;
  final int rows;

  Sheet({
    required this.cols,
    required this.rows,
  });

  factory Sheet.fromJson(Map<String, dynamic> json) {
    return Sheet(
      cols: json['cols'] as int,
      rows: json['rows'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cols': cols,
      'rows': rows,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sheet && other.cols == cols && other.rows == rows;
  }

  @override
  int get hashCode {
    return cols.hashCode ^ rows.hashCode;
  }

  @override
  String toString() => 'Sheet(cols: $cols, rows: $rows)';

  Sheet copyWith({
    int? cols,
    int? rows,
  }) {
    return Sheet(
      cols: cols ?? this.cols,
      rows: rows ?? this.rows,
    );
  }
}

class CustomCategory {
  const CustomCategory({
    required this.id,
    required this.name,
    required this.emojis,
  });

  final String id;
  final String name;
  final List<Emoji> emojis;

  factory CustomCategory.fromJson(Map<String, dynamic> json) {
    final emojis = (json['emojis'] as List)
        .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
        .toList();
    return CustomCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      emojis: emojis,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emojis': emojis.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomCategory &&
        other.id == id &&
        other.name == name &&
        listEquals(other.emojis, emojis);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ emojis.hashCode;
  }

  @override
  String toString() {
    return 'CustomCategory(id: $id, name: $name, emojis: $emojis)';
  }
}
