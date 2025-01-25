import 'dart:ui';

import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:emoji_mart_flutter/src/components/emoji_button.dart';
import 'package:emoji_mart_flutter/src/index.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

typedef EmojiSelectedCallback = void Function(
  Emoji emoji,
  String set,
  int skin,
);

class EmojiPickerListView extends StatefulWidget {
  const EmojiPickerListView({
    super.key,
    required this.searchTextController,
    required this.set,
    required this.skin,
    required this.onEmojiSelected,
    this.customCategory,
    this.columns = 9,
    this.rows = 4,
  });

  final TextEditingController searchTextController;
  final String set;
  final int skin;
  final EmojiSelectedCallback onEmojiSelected;
  final CustomCategory? customCategory;

  final int columns;
  final int rows;

  @override
  State<EmojiPickerListView> createState() => _EmojiPickerListViewState();
}

class _EmojiPickerListViewState extends State<EmojiPickerListView> {
  final scrollController = ScrollController();

  String _searchText = '';

  List<Emoji>? _emojis;

  double get spacing {
    final theme = Theme.of(context);
    final emojiPickerTheme = theme.extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);
    return emojiPickerTheme.spacing;
  }

  double get size {
    final theme = Theme.of(context);
    final emojiPickerTheme = theme.extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);
    return emojiPickerTheme.emojiSize;
  }

  void _searchTextListener() {
    if (_searchText == widget.searchTextController.text) return;
    _searchText = widget.searchTextController.text;
    if (_searchText.trim().isEmpty) {
      _emojis = null;
      setState(() {});
      return;
    }

    _emojis = search(
      query: _searchText,
      emojis: EmojiMartInheritedWidget.of(context).emojis.values.toList(),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.searchTextController.addListener(_searchTextListener);
  }

  @override
  void dispose() {
    widget.searchTextController.removeListener(_searchTextListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = EmojiMartInheritedWidget.of(context);

    final emojiPickerTheme = Theme.of(context).extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);

    return RawScrollbar(
      controller: scrollController,
      radius: Radius.circular(spacing * 2 * 2 / 3),
      thickness: spacing * 2 * 2 / 3,
      crossAxisMargin: spacing * 1 / 3,
      minThumbLength: 70,
      thumbColor: emojiPickerTheme.dimColor,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: switch (_emojis) {
          null => _buildEmojiMartListView(context, data),
          _ => _buildEmojiMartSearchView(context),
        },
      ),
    );
  }

  CustomScrollView _buildEmojiMartSearchView(BuildContext context) {
    final emojiPickerTheme = Theme.of(context).extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);
    final defaultTextStyle = DefaultTextStyle.of(context);
    final textStyle = emojiPickerTheme.textStyle ?? defaultTextStyle.style;

    List<Emoji> emojis = _emojis!;

    return CustomScrollView(
      controller: scrollController,
      key: ValueKey('emoji-mart-search-list'),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: spacing * 2),
          sliver: MultiSliver(
            pushPinnedChildren: true,
            children: [
              SliverPinnedHeader(
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: ColoredBox(
                      color: Colors.white.withAlpha(220),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: spacing,
                          vertical: 3,
                        ),
                        child: Text(
                          emt.search,
                          style: textStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: widget.columns,
                childAspectRatio: 1,
                children: [
                  for (final emoji in emojis)
                    EmojiButton(
                      key: ValueKey(emoji.id),
                      onPressed: () => widget.onEmojiSelected(
                        emoji,
                        widget.set,
                        widget.skin,
                      ),
                      spacing: spacing,
                      child: EmojiWidget(
                        id: emoji.id,
                        set: widget.set,
                        skin: widget.skin,
                        size: size,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmojiMartListView(BuildContext context, EmojiMartData data) {
    final emojiPickerTheme = Theme.of(context).extension<EmojiPickerTheme>() ??
        EmojiPickerTheme.defaultTheme(context);

    final defaultTextStyle = DefaultTextStyle.of(context);
    final textStyle = emojiPickerTheme.textStyle ?? defaultTextStyle.style;

    return CustomScrollView(
      controller: scrollController,
      key: ValueKey('emoji-mart-list'),
      slivers: [
        SliverMainAxisGroup(
          slivers: [
            for (final category in data.categories)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing * 2,
                ),
                sliver: MultiSliver(
                  pushPinnedChildren: true,
                  children: [
                    SliverPinnedHeader(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: ColoredBox(
                            color: Colors.white.withAlpha(220),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: spacing,
                                vertical: 3,
                              ),
                              child: Text(
                                emt['categories.${category.id}'],
                                style: textStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverGrid.count(
                      crossAxisCount: widget.columns,
                      childAspectRatio: 1,
                      children: [
                        for (final emojiId in category.emojis)
                          EmojiButton(
                            onPressed: () {
                              final emoji = data.emojis[emojiId]!;
                              widget.onEmojiSelected(
                                  emoji, widget.set, widget.skin);
                            },
                            spacing: spacing,
                            child: EmojiWidget(
                              key: ValueKey(emojiId),
                              id: emojiId,
                              set: widget.set,
                              skin: widget.skin,
                              size: size,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            if (widget.customCategory case final customCategory?)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing * 2,
                ),
                sliver: MultiSliver(
                  pushPinnedChildren: true,
                  children: [
                    SliverPinnedHeader(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: ColoredBox(
                            color: Colors.white.withAlpha(220),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: spacing,
                                vertical: 3,
                              ),
                              child: Text(
                                customCategory.name,
                                style: textStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverGrid.count(
                      crossAxisCount: widget.columns,
                      childAspectRatio: 1,
                      children: [
                        for (final emoji in customCategory.emojis)
                          EmojiButton(
                            onPressed: () => widget.onEmojiSelected(
                              emoji,
                              widget.set,
                              widget.skin,
                            ),
                            spacing: spacing,
                            child: EmojiWidget(
                              key: ValueKey(emoji),
                              data: emoji,
                              set: widget.set,
                              skin: widget.skin,
                              size: size,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
