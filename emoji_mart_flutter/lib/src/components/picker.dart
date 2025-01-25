import 'dart:async';
import 'dart:convert';

import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:emoji_mart_flutter/src/components/emoji_button.dart';
import 'package:emoji_mart_flutter/src/components/emoji_picker_list_view.dart';
import 'package:emoji_mart_flutter/src/components/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<Uri, EmojiMartData> _cachedData = {};

Future<EmojiMartData> fetchData(
  String set,
  String emojiVersion,
) async {
  final uri = Uri.parse(
    'https://cdn.jsdelivr.net/npm/@emoji-mart/data@latest/sets/$emojiVersion/$set.json',
  );
  if (_cachedData.containsKey(uri)) return _cachedData[uri]!;

  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final data = EmojiMartData.fromJson(jsonDecode(response.body));

    _cachedData[uri] = data;
    Timer(Duration(minutes: 2), () => _cachedData.remove(uri));

    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class EmojiPicker extends StatefulWidget {
  const EmojiPicker({
    super.key,
    this.set = 'native',
    this.emojiVersion = '15',
    this.customCategory,
    required this.onEmojiSelected,
    this.columns = 9,
    this.rows = 4,
  });

  static double computeMaxWidth({
    required double size,
    required int columns,
    required double spacing,
  }) {
    return (size + spacing * 2) * columns + spacing * 4;
  }

  static double computeMaxHeight({
    required double size,
    required int rows,
    required double spacing,
  }) {
    return 20 +
        spacing * 2 +
        spacing * 2 +
        (size + spacing * 2) * rows +
        27 +
        size +
        spacing * 2 +
        3;
  }

  /// The emoji set to use. Defaults to 'native'.
  /// You can use [EmojiPreset] to get the available sets.
  final String set;
  final String emojiVersion;
  final EmojiSelectedCallback onEmojiSelected;
  final CustomCategory? customCategory;

  final int columns;
  final int rows;

  @override
  State<EmojiPicker> createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  late Future<EmojiMartData> dataFuture =
      fetchData(widget.set, widget.emojiVersion);

  final TextEditingController searchTextController = TextEditingController();
  final ValueNotifier<int> skin = ValueNotifier<int>(0);

  @override
  void didUpdateWidget(covariant EmojiPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.set != widget.set ||
        oldWidget.emojiVersion != widget.emojiVersion) {
      dataFuture = fetchData(widget.set, widget.emojiVersion);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final emojiPickerTheme = theme.extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);
    final EmojiPickerTheme(:spacing, emojiSize: size) = emojiPickerTheme;

    final emojiMartInheritedData = EmojiMartInheritedWidget.maybeOf(context);
    if (emojiMartInheritedData != null) {
      dataFuture = Future.value(emojiMartInheritedData);
    }

    Widget emojiDisplayer = FutureBuilder(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          Widget emoji = EmojiMartInheritedWidget(
            data: snapshot.data!,
            child: ListenableBuilder(
              listenable: skin,
              builder: (context, child) => EmojiPickerListView(
                searchTextController: searchTextController,
                customCategory: widget.customCategory,
                onEmojiSelected: widget.onEmojiSelected,

                ///
                set: widget.set,
                skin: skin.value,
                columns: widget.columns,
                rows: widget.rows,
              ),
            ),
          );

          return RawScrollbar(
            radius: Radius.circular(spacing * 2 * 2 / 3),
            thickness: spacing * 2 * 2 / 3,
            crossAxisMargin: spacing * 1 / 3,
            minThumbLength: 70,
            thumbColor: emojiPickerTheme.dimColor,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: emoji,
            ),
          );
        }
        if (snapshot.hasError) return SizedBox();
        return SizedBox();
      },
    );

    emojiDisplayer = ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: (size + spacing * 2) * widget.rows + 27,
        maxHeight: (size + spacing * 2) * widget.rows + 27,
      ),
      child: emojiDisplayer,
    );

    Widget child = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: emojiPickerTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: emojiPickerTheme.boxShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: spacing * 2,
              top: spacing * 2,
              right: spacing * 2,
            ),
            child: SearchTextField(
              textController: searchTextController,
            ),
          ),
          emojiDisplayer,
          Divider(
            height: 1,
            thickness: 0.5,
            color: emojiPickerTheme.dimColor,
          ),
          Builder(
            builder: (context) => SizedBox(
              height: size + spacing * 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: spacing),
                        child: Builder(
                          builder: (context) {
                            final defaultTextStyle =
                                DefaultTextStyle.of(context);

                            return Text(
                              emt.skin_tone,
                              overflow: TextOverflow.ellipsis,
                              style: defaultTextStyle.style.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: emojiPickerTheme.onBackgroundColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final (index, skinColor) in [
                          0xFFFFD225,
                          0xFFFFD7C2,
                          0xFFE0AE90,
                          0xFFC39060,
                          0xFF94471B,
                          0xFF492103
                        ].indexed)
                          EmojiButton(
                            onPressed: () => skin.value = index,
                            spacing: spacing,
                            child: SizedBox.square(
                              dimension: size,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(skinColor),
                                    width: 1,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(skinColor).withValues(alpha: 0.3),
                                      Color(skinColor),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(size / 2),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    child = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: EmojiPicker.computeMaxWidth(
          size: size,
          columns: widget.columns,
          spacing: spacing,
        ),
        maxHeight: EmojiPicker.computeMaxHeight(
          size: size,
          rows: widget.rows,
          spacing: spacing,
        ),
      ),
      child: child,
    );

    child = Theme(
      data: theme.copyWith(
        extensions: {
          ...theme.extensions.values,
          emojiPickerTheme,
        },
      ),
      child: child,
    );

    return child;
  }
}
