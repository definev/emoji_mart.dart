import 'package:flutter/material.dart';

class EmojiButton extends StatefulWidget {
  const EmojiButton({
    super.key,
    required this.onPressed,
    required this.spacing,
    required this.child,
  });

  final VoidCallback? onPressed;
  final double spacing;
  final Widget child;

  @override
  State<EmojiButton> createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  WidgetState? state;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        if (state != WidgetState.hovered) {
          setState(() => state = WidgetState.hovered);
        }
      },
      onEnter: (_) {
        if (state != WidgetState.hovered) {
          setState(() => state = WidgetState.hovered);
        }
      },
      onExit: (_) {
        if (state != null) {
          setState(() => state = null);
        }
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: state == WidgetState.hovered
                ? Colors.grey[200]
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.spacing),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
