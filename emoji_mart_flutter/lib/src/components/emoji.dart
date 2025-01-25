import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_mart_data/emoji_mart_data.dart';
import 'package:emoji_mart_flutter/src/components/emoji_mart_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final SHORTCODES_REGEX = RegExp(r'^(?:\:([^\:]+)\:)(?:\:skin-tone-(\d)\:)?$');

class EmojiWidget extends StatefulWidget {
  const EmojiWidget({
    super.key,
    this.id,
    this.skin,
    this.shortcodes,
    required this.set,
    required this.size,
    this.data,
    this.getImageUri,
    this.getSpritesheetUri = defaultGetSpritesheetUri,
    this.fallbackBuilder,
  });

  static Uri defaultGetSpritesheetUri(String set) => Uri.parse(
        'https://cdn.jsdelivr.net/npm/emoji-datasource-$set@15.0.1/img/$set/sheets-256/64.png',
      );
  static Uri defaultGetImageUri(String set, String unified) => Uri.parse(
        'https://cdn.jsdelivr.net/npm/emoji-datasource-$set@15.0.1/img/$set/64/$unified.png',
      );

  final String set;
  final Emoji? data;
  final String? id;
  final int? skin;
  final String? shortcodes;
  final Uri Function(String set, String unified)? getImageUri;
  final Uri Function(String set)? getSpritesheetUri;

  final double size;

  final Widget Function(BuildContext context)? fallbackBuilder;

  @override
  State<EmojiWidget> createState() => EmojiWidgetState();
}

class EmojiWidgetState extends State<EmojiWidget> {
  late var id = widget.id;
  late Emoji data;
  late int skin = 0;
  Skin get emojiSkin {
    if (widget.skin != null) {
      return data.skins.elementAtOrNull(widget.skin!) ?? data.skins[0];
    }
    return data.skins[skin];
  }

  Uri? imageSrc;
  Uri? _calculateImageSrc() {
    if (widget.getImageUri != null) {
      final uri = widget.getImageUri!(widget.set, emojiSkin.unified);
      return uri;
    }

    if (widget.getSpritesheetUri != null) {
      return null;
    }
    if (widget.set == 'native') {
      return null;
    }

    return Uri.parse(
      'https://cdn.jsdelivr.net/npm/emoji-datasource-${widget.set}@15.0.1/img/${widget.set}/64/${emojiSkin.unified}.png',
    );
  }

  late Uri spritesheetSrc;
  Uri _calculateSpritesheetSrc() {
    if (widget.getSpritesheetUri != null) {
      return widget.getSpritesheetUri!(widget.set);
    }
    return Uri.parse(
      'https://cdn.jsdelivr.net/npm/emoji-datasource-${widget.set}@15.0.1/img/${widget.set}/sheets-256/64.png',
    );
  }

  void _calculateIdAndSkinFromShortcodes() {
    if (widget.shortcodes case final shortcodes?) {
      final match = SHORTCODES_REGEX.firstMatch(shortcodes);
      if (match == null) return;
      id = match.group(0)!;
      if (match.group(1) case final skinGroup?) {
        skin = int.tryParse(skinGroup) ?? 0;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    skin = widget.skin ?? 0;
    _calculateIdAndSkinFromShortcodes();
    imageSrc = _calculateImageSrc();
    spritesheetSrc = _calculateSpritesheetSrc();
  }

  @override
  void didUpdateWidget(covariant EmojiWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skin != widget.skin) {
      skin = widget.skin ?? 0;
      imageSrc = _calculateImageSrc();
      spritesheetSrc = _calculateSpritesheetSrc();
      setState(() {});
    }
    if (oldWidget.shortcodes != widget.shortcodes) {
      _calculateIdAndSkinFromShortcodes();
      imageSrc = _calculateImageSrc();
      spritesheetSrc = _calculateSpritesheetSrc();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);

    final emojiMartData = EmojiMartInheritedWidget.of(context);
    data = widget.data ?? emojiMartData.emojis[widget.id!]!;

    if (imageSrc case final imageSrc?) {
      return _buildUriImage(context, imageSrc);
    }

    final skin = emojiSkin;

    if (widget.set == 'native') {
      return Text(
        skin.native,
        style: defaultTextStyle.style.copyWith(
          fontSize: widget.size,
          height: 1,
          decoration: TextDecoration.none,
        ),
        textHeightBehavior: TextHeightBehavior(),
      );
    }

    if (skin.x == null || skin.y == null) {
      return widget.fallbackBuilder?.call(context) ??
          _buildUriImage(context,
              EmojiWidget.defaultGetImageUri(widget.set, skin.unified));
    }

    assert(skin.x != null && skin.y != null, 'Skin x and y must not be null');

    return SpriteImage(
      uri: spritesheetSrc,
      size: widget.size,
      x: skin.x!,
      y: skin.y!,
    );
  }

  Widget _buildUriImage(
    BuildContext context,
    Uri imageSrc,
  ) {
    return switch (imageSrc.scheme) {
      'http' || 'https' => Image.network(
          imageSrc.toString(),
          height: widget.size,
          width: widget.size,
        ),
      'asset' || 'assets' => Image.asset(
          imageSrc.toString(),
          height: widget.size,
          width: widget.size,
        ),
      'file' => Image.file(
          File(imageSrc.toString()),
          height: widget.size,
          width: widget.size,
        ),
      _ => widget.fallbackBuilder?.call(context) ?? const Placeholder(),
    };
  }
}

class SpriteImage extends StatefulWidget {
  const SpriteImage({
    super.key,
    required this.uri,
    required this.x,
    required this.y,
    required this.size,
    this.fallbackBuilder,
  });

  final Uri uri;
  final int x;
  final int y;
  final double size;

  final Widget Function(BuildContext context)? fallbackBuilder;

  @override
  State<SpriteImage> createState() => _SpriteImageState();
}

class _SpriteImageState extends State<SpriteImage> {
  late ImageProvider? imageProvider = _getImageProvider();
  ImageProvider _getImageProvider() {
    final result = CachedNetworkImageProvider(widget.uri.toString());
    return result;
  }

  ImageStream? _imageStream;
  StreamController<ui.Image> imageStreamController = StreamController();

  late final _imageStreamListener = ImageStreamListener(
    (ImageInfo image, bool synchronousCall) =>
        imageStreamController.sink.add(image.image),
    onError: (error, stackTrace) =>
        imageStreamController.sink.addError(error, stackTrace),
  );

  @override
  void initState() {
    super.initState();
    _changeSpriteImage();
  }

  @override
  void dispose() {
    _imageStream?.removeListener(_imageStreamListener);
    _imageStream = null;
    imageStreamController.close();
    super.dispose();
  }

  void _changeSpriteImage() {
    imageProvider = _getImageProvider();
    _imageStream = imageProvider!.resolve(ImageConfiguration());
    _imageStream?.addListener(_imageStreamListener);
  }

  @override
  void didUpdateWidget(covariant SpriteImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri) {
      _imageStream?.removeListener(_imageStreamListener);
      _changeSpriteImage();
      setState(() {});
    }
    if (oldWidget.x != widget.x || oldWidget.y != widget.y) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final sheet = EmojiMartInheritedWidget.of(context).sheet;

    return StreamBuilder(
      stream: imageStreamController.stream,
      builder: (context, snapshot) {
        if (snapshot.data case final image?) {
          return CustomPaint(
            painter: SpritesheetImagePainter(
              spritesheet: image,
              sheet: sheet,
              x: widget.x,
              y: widget.y,
              size: widget.size,
            ),
            child: SizedBox(
              height: widget.size,
              width: widget.size,
            ),
          );
        }
        if (snapshot.hasError) {
          return widget.fallbackBuilder?.call(context) ?? const SizedBox();
        }

        return SizedBox();
      },
    );
  }
}

class SpritesheetImagePainter extends CustomPainter {
  SpritesheetImagePainter({
    super.repaint,
    required this.spritesheet,
    required this.sheet,
    required this.x,
    required this.y,
    required this.size,
  });

  final ui.Image spritesheet;
  final Sheet sheet;

  final int x;
  final int y;
  final double size;

  @override
  void paint(Canvas canvas, Size size) {
    final baseHeight = spritesheet.height ~/ sheet.rows;
    final baseWidth = spritesheet.width ~/ sheet.cols;

    final src = Rect.fromLTWH(
      x * baseWidth.toDouble(),
      y * baseHeight.toDouble(),
      baseWidth.toDouble(),
      baseHeight.toDouble(),
    );

    final dst = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    final paint = Paint();

    canvas.drawImageRect(spritesheet, src, dst, paint);
  }

  @override
  bool shouldRepaint(covariant SpritesheetImagePainter oldDelegate) {
    return oldDelegate.x != x || oldDelegate.y != y;
  }
}
