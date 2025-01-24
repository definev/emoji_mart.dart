import 'dart:collection';

import 'package:emoji_mart_data/emoji_mart_data.dart';

final RegExp shortcodesRegex =
    RegExp(r'^(?:\:([^\:]+)\:)(?:\:skin-tone-(\d)\:)?$');

List<Emoji> search({
  required String query,
  required List<Emoji> emojis,
  int maxResults = 90,
}) {
  if (query.trim().isEmpty) return [];

  final values = query
      .toLowerCase()
      .replaceAllMapped(RegExp(r'(\w)-'), (match) => '${match[1]} ')
      .split(RegExp(r'[\s|,]+'))
      .where((word) => word.trim().isNotEmpty)
      .toSet()
      .toList();

  if (values.isEmpty) return [];

  LinkedHashSet<Emoji> pool = LinkedHashSet();

  for (final searchValue in values) {
    if (emojis.isEmpty) break;

    List<Emoji> results = [];
    for (final emoji in emojis) {
      if (emoji.id.contains(searchValue)) {
        results.add(emoji);
        continue;
      }
      if (emoji.keywords.any((key) => key.contains(searchValue))) {
        results.add(emoji);
        continue;
      }
      if (emoji.name.toLowerCase().contains(searchValue)) {
        results.add(emoji);
        continue;
      }
    }

    pool.addAll(results);
    if (pool.length >= maxResults) break;
  }

  return pool.toList().take(maxResults).toList();
}
