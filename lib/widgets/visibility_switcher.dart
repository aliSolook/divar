import 'package:flutter/material.dart';

class VisibilitySwitcher extends StatelessWidget {
  const VisibilitySwitcher({
    super.key,
    required this.visibile,
    required this.child,
    required this.builder,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final bool visibile;
  final Duration duration;
  final Widget Function(Widget child, double value, bool isHiding) builder;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: visibile ? 0 : 1, end: visibile ? 1 : 0),
      duration: duration,
      builder: (context, value, child) {
        return Visibility(
          visible: value != 1,
          child: builder(child!, value, !visibile),
        );
      },
      child: child,
    );
  }
}
