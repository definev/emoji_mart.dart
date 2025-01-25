import 'dart:ui';

import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode focusNode =
      FocusNode(debugLabel: 'EmojiMart-SearchTextField');
  TextEditingController get textController => widget.textController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextStyle = DefaultTextStyle.of(context);

    final emojiPickerTheme = theme.extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);

    final primaryColor = theme.primaryColor;
    final textStyle = (emojiPickerTheme.textStyle ?? defaultTextStyle.style)
        .copyWith(fontSize: 14);

    final iconColor = switch (focusNode.hasFocus) {
      true => primaryColor,
      _ when textController.text.isNotEmpty => emojiPickerTheme.inactiveColor,
      false => emojiPickerTheme.inactiveColor,
    };

    return ListenableBuilder(
      listenable: Listenable.merge([
        focusNode,
        textController,
      ]),
      builder: (context, child) => Container(
        padding: EdgeInsets.all(emojiPickerTheme.spacing),
        decoration: BoxDecoration(
          color: switch (focusNode.hasFocus) {
            true => emojiPickerTheme.backgroundColor,
            false => emojiPickerTheme.dimColor,
          },
          border: Border.all(
            color: switch (focusNode.hasFocus) {
              true => primaryColor,
              false => Colors.transparent,
            },
          ),
          boxShadow: [
            if (focusNode.hasFocus)
              BoxShadow(
                color: primaryColor.withValues(alpha: 0.2),
                blurRadius: 5,
              ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: emojiPickerTheme.spacing),
              child: Icon(
                CupertinoIcons.search,
                size: 15,
                color: iconColor,
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: textController,
                style: textStyle.copyWith(
                  color: emojiPickerTheme.onBackgroundColor,
                ),
                selectionHeightStyle: BoxHeightStyle.strut,
                cursorHeight: textStyle.fontSize! * 1.2,
                cursorWidth: 1.5,
                decoration: InputDecoration.collapsed(
                  hintText: emt.search,
                  hintStyle: textStyle.copyWith(
                    color: emojiPickerTheme.inactiveColor,
                  ),
                ),
              ),
            ),
            if (textController.text.isNotEmpty)
              GestureDetector(
                onTap: () => textController.clear(),
                child: Icon(
                  CupertinoIcons.clear,
                  size: 15,
                  color: iconColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
