import 'dart:convert';

import 'package:emoji_mart_data/src/model.dart';
import 'package:flutter/services.dart';

Future<EmojiMartData> emojiMartDataFromSet(String version, String set, {
  String prefix = 'packages/emoji_mart_data/sets',
}) async {
  final path = '$prefix/$version/$set.json';
  final data = await rootBundle.loadString(path);
  return EmojiMartData.fromJson(jsonDecode(data));
}
