import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  LocaleSettings.setLocaleRaw('en');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.red.withValues(
            alpha: 0.3,
          ),
          cursorColor: Colors.red,
          selectionHandleColor: Colors.red,
        ),
      ),
      home: Builder(
        builder: (context) => Center(
          child: EmojiPicker(
            set: EmojiPreset.google.preset,
            emojiVersion: '15',
            onEmojiSelected: (emoji) {
              print('Selected emoji: $emoji');
            },
            size: 24,
            columns: 9,
            rows: 6,
            spacing: 6,
          ),
        ),
      ),
    );
  }
}
