# 🏪 Emoji Mart

✨ A highly customizable Emoji picker widget for Flutter. ✨ (Port of [emoji-mart](https://github.com/missive/emoji-mart))

|                                                                                                            |                                                                                                            |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/apple.png)    | ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/facebook.png) |
| ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/twitter.png)  | ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/google.png)   |
| ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/skin-1.png)   | ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/skin-2.png)   |
| ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/search-1.png) | ![](https://raw.githubusercontent.com/definev/emoji_mart.dart/main/emoji_mart_flutter/assets/search-2.png) |

## 📖 Table of Contents

- Installation ⬇️
- Usage 🧑‍💻
    - Configuration ⚙️
    - Customization 🎨
    - Localization 🌍

## Installation ⬇️

To add `emoji_mart_flutter` to your Flutter project, run:

```shell
flutter pub add emoji_mart_flutter
```

## Usage 🧑‍💻

The `EmojiPicker` widget provides a user-friendly interface for selecting emojis. Here’s a basic example of how to implement it:

```dart
EmojiPicker(
    set: EmojiPreset.google.preset,
    emojiVersion: '15',
    /// Callback triggered when an emoji is selected
    onEmojiSelected: (Emoji emoji) {
      // Handle the selected emoji
    },
    size: 24,
    columns: 9,
    rows: 6,
    spacing: 6,
)
```

### Configuration ⚙️

`EmojiPicker` supports five distinct emoji presets, each with unique stylistic characteristics: `native`, `facebook`, `apple`, `google`, and `twitter`. 🖼️

Each preset includes multiple versions corresponding to different Unicode specifications. These versions include: `1`, `2`, `3`, `4`, `5`, `11`, `12`, `12.1`, `13`, `13.1`, `14`, and `15`. 🔢

The `onEmojiSelected` callback function is invoked when a user selects an emoji, providing you with an `Emoji` object containing relevant data. 👆

The `Emoji` data structure contains the following key properties:

```dart
  final String id;
  final String name;
  final List<String> keywords;
  final List<Skin> skins;
  final double version;
```

| Name       | Description                                                                         |
| ---------- | ----------------------------------------------------------------------------------- |
| `id`       | A unique identifier for the emoji.                                                  |
| `name`     | The common name of the emoji (e.g., `"grinning face"`).                             |
| `keywords` | A list of keywords associated with the emoji, facilitating search functionality.    |
| `skins`    | A list of `Skin` objects representing various visual variations (e.g., skin tones). |
| `version`  | The Unicode version in which this emoji was introduced.                             |

The `Skin` object provides the specific visual details:

```dart
  final String unified;
  final String native;
  final int? x;
  final int? y;
```

| Name      | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| `unified` | The unified Unicode code point representation for this skin variation. |
| `native`  | The actual character(s) representing the emoji.                        |
| `x`       | The X-coordinate of the emoji within the spritesheet.                  |
| `y`       | The Y-coordinate of the emoji within the spritesheet.                  |

### Customization 🎨

The visual appearance of the `EmojiPicker` is highly customizable through the following properties:

| Name      | Description                                                | Default value |
| --------- | ---------------------------------------------------------- | ------------- |
| `size`    | The size, in pixels, of a single emoji. 📏                  | `24`          |
| `columns` | The number of emoji columns to display in a row. 🔢         | `9`           |
| `rows`    | The maximum number of emoji rows to display. 🔢             | `6`           |
| `spacing` | The space, in pixels, between individual emoji elements. ↔️ | `6`           |

Further text styling can be applied by overriding the `DefaultTextStyle` widget. ✍️

### Localization 🌍

`emoji_mart_flutter` leverages the `slang` package for comprehensive localization. Refer to the `slang` documentation for detailed instructions on setting up and managing translations. 🌐

To set the locale programmatically, use:

```dart
import 'package:emoji_mart_flutter/emoji_mart_flutter.dart' as emoji_mart;

...
emoji_mart.LocaleSettings.setLocaleRaw('vi'); // Use 'en' for English, 'es' for Spanish, etc.
```
