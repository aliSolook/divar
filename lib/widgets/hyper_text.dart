import 'package:flutter/material.dart';

class HyperText extends StatefulWidget {
  const HyperText({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.hoverStyle,
  });

  final String text;
  final TextStyle? style;
  final TextStyle? hoverStyle;
  final void Function() onTap;

  @override
  State<HyperText> createState() => _HyperTextState();
}

class _HyperTextState extends State<HyperText> {
  bool hasEntered = false;

  @override
  Widget build(BuildContext context) {
    Widget effectiveWidget = GestureDetector(
      onTap: widget.onTap,
      child: Text(
        widget.text,
        style: hasEntered ? widget.hoverStyle ?? widget.style : widget.style,
      ),
    );

    if (widget.hoverStyle != null) {
      effectiveWidget = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => hasEntered = true),
        onExit: (event) => setState(() => hasEntered = false),
        child: effectiveWidget,
      );
    }

    return effectiveWidget;
  }
}
