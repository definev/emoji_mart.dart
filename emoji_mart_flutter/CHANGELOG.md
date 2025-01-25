## 0.1.2
- Fix: Missing `ScrollPosition` in `RawScrollbar`

## 0.1.1
- Feat: Adding `showEmojiPicker` API

## 0.1.0
BREAKING CHANGES:
- Adding `EmojiPickerTheme` for control appearance of `EmojiPicker` widget.
- Accessing `EmojiPickerTheme` throught Flutter theme extensions API. `Theme.of(context).extension<EmojiPickerTheme>() ?? EmojiPickerTheme.defaultTheme(context)`

- Migration:
  - `size`: You can access `size` throught `EmojiPickerTheme`  
  - `spacing`: You can access `spacing` throught `EmojiPickerTheme`

## 0.0.2

- Fix README.md

## 0.0.1

* Initial release
