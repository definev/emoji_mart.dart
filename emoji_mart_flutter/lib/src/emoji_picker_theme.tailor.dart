// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'emoji_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$EmojiPickerThemeTailorMixin on ThemeExtension<EmojiPickerTheme> {
  double get emojiSize;
  double get spacing;
  TextStyle? get textStyle;
  Color get backgroundColor;
  Color get onBackgroundColor;
  Color get dimColor;
  Color get inactiveColor;
  List<BoxShadow> get boxShadow;

  @override
  EmojiPickerTheme copyWith({
    double? emojiSize,
    double? spacing,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? onBackgroundColor,
    Color? dimColor,
    Color? inactiveColor,
    List<BoxShadow>? boxShadow,
  }) {
    return EmojiPickerTheme(
      emojiSize: emojiSize ?? this.emojiSize,
      spacing: spacing ?? this.spacing,
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onBackgroundColor: onBackgroundColor ?? this.onBackgroundColor,
      dimColor: dimColor ?? this.dimColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }

  @override
  EmojiPickerTheme lerp(
      covariant ThemeExtension<EmojiPickerTheme>? other, double t) {
    if (other is! EmojiPickerTheme) return this as EmojiPickerTheme;
    return EmojiPickerTheme(
      emojiSize: t < 0.5 ? emojiSize : other.emojiSize,
      spacing: t < 0.5 ? spacing : other.spacing,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      onBackgroundColor:
          Color.lerp(onBackgroundColor, other.onBackgroundColor, t)!,
      dimColor: Color.lerp(dimColor, other.dimColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      boxShadow: t < 0.5 ? boxShadow : other.boxShadow,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmojiPickerTheme &&
            const DeepCollectionEquality().equals(emojiSize, other.emojiSize) &&
            const DeepCollectionEquality().equals(spacing, other.spacing) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(onBackgroundColor, other.onBackgroundColor) &&
            const DeepCollectionEquality().equals(dimColor, other.dimColor) &&
            const DeepCollectionEquality()
                .equals(inactiveColor, other.inactiveColor) &&
            const DeepCollectionEquality().equals(boxShadow, other.boxShadow));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(emojiSize),
      const DeepCollectionEquality().hash(spacing),
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(onBackgroundColor),
      const DeepCollectionEquality().hash(dimColor),
      const DeepCollectionEquality().hash(inactiveColor),
      const DeepCollectionEquality().hash(boxShadow),
    );
  }
}

extension EmojiPickerThemeBuildContextProps on BuildContext {
  EmojiPickerTheme get emojiPickerTheme =>
      Theme.of(this).extension<EmojiPickerTheme>()!;
  double get emojiSize => emojiPickerTheme.emojiSize;
  double get spacing => emojiPickerTheme.spacing;
  TextStyle? get textStyle => emojiPickerTheme.textStyle;
  Color get backgroundColor => emojiPickerTheme.backgroundColor;
  Color get onBackgroundColor => emojiPickerTheme.onBackgroundColor;
  Color get dimColor => emojiPickerTheme.dimColor;
  Color get inactiveColor => emojiPickerTheme.inactiveColor;
  List<BoxShadow> get boxShadow => emojiPickerTheme.boxShadow;
}
