import 'dart:convert';

import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:emoji_mart_flutter/src/components/emoji_button.dart';
import 'package:emoji_mart_flutter/src/components/emoji_picker_list_view.dart';
import 'package:emoji_mart_flutter/src/components/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<EmojiMartData> fetchData(
  String set,
  String emojiVersion,
) async {
  final response = await http.get(
    Uri.parse(
      'https://cdn.jsdelivr.net/npm/@emoji-mart/data@latest/sets/$emojiVersion/$set.json',
    ),
  );
  if (response.statusCode == 200) {
    return EmojiMartData.fromJson(jsonDecode(response.body));
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
    this.size = 24,
    this.spacing = 6,
  });

  /// The emoji set to use. Defaults to 'native'.
  /// You can use [EmojiPreset] to get the available sets.
  final String set;
  final String emojiVersion;
  final EmojiSelectedCallback onEmojiSelected;
  final CustomCategory? customCategory;

  final int columns;
  final int rows;
  final double size;
  final double spacing;

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
    final emojiMartInheritedData = EmojiMartInheritedWidget.maybeOf(context);
    if (emojiMartInheritedData != null) {
      dataFuture = Future.value(emojiMartInheritedData);
    }

    Widget emojiDisplayer = FutureBuilder(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return EmojiMartInheritedWidget(
            data: snapshot.data!,
            child: ListenableBuilder(
              listenable: skin,
              builder: (context, child) => EmojiPickerListView(
                searchTextController: searchTextController,
                customCategory: widget.customCategory,
                set: widget.set,
                skin: skin.value,
                onEmojiSelected: widget.onEmojiSelected,
                columns: widget.columns,
                rows: widget.rows,
                size: widget.size,
                spacing: widget.spacing,
              ),
            ),
          );
        }
        if (snapshot.hasError) return SizedBox();
        return SizedBox();
      },
    );

    emojiDisplayer = ScrollbarTheme(
      data: ScrollbarThemeData(
        trackVisibility: WidgetStatePropertyAll(false),
        thumbColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.grey[400];
            }

            return Colors.grey[200];
          },
        ),
        minThumbLength: 70,
        crossAxisMargin: widget.spacing * 1 / 3,
        thickness: WidgetStatePropertyAll(widget.spacing * 2 * 2 / 3),
      ),
      child: emojiDisplayer,
    );

    emojiDisplayer = ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: (widget.size + widget.spacing * 2) * widget.rows + 27,
        maxHeight: (widget.size + widget.spacing * 2) * widget.rows + 27,
      ),
      child: emojiDisplayer,
    );

    Widget child = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widget.spacing * 2,
              top: widget.spacing * 2,
              right: widget.spacing * 2,
            ),
            child: SearchTextField(
              textController: searchTextController,
            ),
          ),
          emojiDisplayer,
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey[300],
          ),
          Builder(
            builder: (context) => SizedBox(
              height: widget.size + widget.spacing * 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.spacing * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: widget.spacing),
                        child: Material(
                          color: Colors.transparent,
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
                                ),
                              );
                            },
                          ),
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
                            spacing: widget.spacing,
                            child: SizedBox.square(
                              dimension: widget.size,
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
                                  borderRadius:
                                      BorderRadius.circular(widget.size / 2),
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

    child = Material(
      color: Colors.transparent,
      child: child,
    );

    child = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: (widget.size + widget.spacing * 2) * widget.columns +
            widget.spacing * 4,
      ),
      child: child,
    );

    return child;
  }
}
