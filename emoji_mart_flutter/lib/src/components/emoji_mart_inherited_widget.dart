import 'package:emoji_mart_data/emoji_mart_data.dart';
import 'package:flutter/widgets.dart';

class EmojiMartInheritedWidget extends InheritedWidget {
  const EmojiMartInheritedWidget({
    super.key,
    required super.child,
    required this.data,
  });

  final EmojiMartData data;

  static EmojiMartData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EmojiMartInheritedWidget>()!.data;
  }

  static EmojiMartData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EmojiMartInheritedWidget>()?.data;
  }

  @override
  bool updateShouldNotify(covariant EmojiMartInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}
