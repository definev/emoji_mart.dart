import 'dart:ui';

import 'package:emoji_mart_data/emoji_mart_data.dart';
import 'package:emoji_mart_flutter/emoji_mart_flutter.dart';
import 'package:emoji_mart_flutter/src/components/emoji_button.dart';
import 'package:emoji_mart_flutter/src/index.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
    this.size = 24,
    this.spacing = 6,
  });

  final TextEditingController searchTextController;
  final String set;
  final int skin;
  final void Function(Emoji emoji) onEmojiSelected;
  final CustomCategory? customCategory;

  final int columns;
  final int rows;
  final double size;
  final double spacing;

  @override
  State<EmojiPickerListView> createState() => _EmojiPickerListViewState();
}

class _EmojiPickerListViewState extends State<EmojiPickerListView> {
  String _searchText = '';

  List<Emoji>? _emojis;

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
    final defaultTextStyle = DefaultTextStyle.of(context);

    final data = EmojiMartInheritedWidget.of(context);

    return switch (_emojis) {
      null => _buildEmojiMartListView(context, data),
      final emojis => CustomScrollView(
          key: ValueKey('emoji-mart-search-list'),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing * 2),
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
                              horizontal: widget.spacing,
                              vertical: 3,
                            ),
                            child: Text(
                              emt.search,
                              style: defaultTextStyle.style.copyWith(
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
                          onPressed: () => widget.onEmojiSelected(emoji),
                          spacing: widget.spacing,
                          child: EmojiWidget(
                            id: emoji.id,
                            set: widget.set,
                            skin: widget.skin,
                            size: widget.size,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    };
  }

  Widget _buildEmojiMartListView(BuildContext context, EmojiMartData data) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return CustomScrollView(
      key: ValueKey('emoji-mart-list'),
      slivers: [
        SliverMainAxisGroup(
          slivers: [
            for (final category in data.categories)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.spacing * 2,
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
                                horizontal: widget.spacing,
                                vertical: 3,
                              ),
                              child: Text(
                                emt['categories.${category.id}'],
                                style: defaultTextStyle.style.copyWith(
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
                              widget.onEmojiSelected(emoji);
                            },
                            spacing: widget.spacing,
                            child: EmojiWidget(
                              key: ValueKey(emojiId),
                              id: emojiId,
                              set: widget.set,
                              skin: widget.skin,
                              size: widget.size,
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
                  horizontal: widget.spacing * 2,
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
                                horizontal: widget.spacing,
                                vertical: 3,
                              ),
                              child: Text(
                                customCategory.name,
                                style: defaultTextStyle.style.copyWith(
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
                            onPressed: () => widget.onEmojiSelected(emoji),
                            spacing: widget.spacing,
                            child: EmojiWidget(
                              key: ValueKey(emoji),
                              data: emoji,
                              set: widget.set,
                              skin: widget.skin,
                              size: widget.size,
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
