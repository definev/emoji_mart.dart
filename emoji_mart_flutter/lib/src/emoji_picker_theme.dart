import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'emoji_picker_theme.tailor.dart';

@TailorMixin()
class EmojiPickerTheme extends ThemeExtension<EmojiPickerTheme>
    with _$EmojiPickerThemeTailorMixin {
  EmojiPickerTheme({
    this.emojiSize = 24,
    this.spacing = 6,
    this.textStyle,
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.dimColor,
    required this.inactiveColor,
    required this.boxShadow,
  });

  static EmojiPickerTheme defaultTheme(BuildContext context) {
    final theme = Theme.of(context);

    return EmojiPickerTheme(
      emojiSize: 24,
      spacing: 6,
      backgroundColor: theme.colorScheme.surface,
      onBackgroundColor: theme.colorScheme.onSurface,
      dimColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
      inactiveColor: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      boxShadow: [
        BoxShadow(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: Offset(0, 20),
        ),
      ],
    );
  }

  @override
  final double emojiSize;
  @override
  final double spacing;
  @override
  final TextStyle? textStyle;
  @override
  final Color backgroundColor;
  @override
  final Color onBackgroundColor;
  @override
  final Color dimColor;
  @override
  final Color inactiveColor;
  @override
  final List<BoxShadow> boxShadow;
}
