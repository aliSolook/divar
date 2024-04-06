import 'dart:async';
import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDown extends StatefulWidget {
  const CountDown({
    super.key,
    required this.duration,
    required this.controller,
    this.unfinishedState = const CountDownState(),
    this.builder,
    this.fps = 1,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.alignment = Alignment.center,
    this.finishedState,
  });

  final Duration duration;
  final Widget Function(Duration remaining)? builder;
  final double fps;
  final CountDownState unfinishedState;

  /// if null, [unfinishedState] will be used instead.
  final CountDownState? finishedState;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final AlignmentGeometry? alignment;
  final CountDownController controller;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Duration remainingDuration = widget.duration;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller._state = null;
    super.dispose();
  }

  @override
  void initState() {
    widget.controller._state = this;
    super.initState();
  }

  void _startTimer(){
    _timer?.cancel();

    final period = Duration(milliseconds: 1000 ~/ widget.fps);
    _timer = Timer.periodic(
      period,
      (timer) {
        if (remainingDuration < period) {
          setState(() {
            remainingDuration = Duration.zero;
            timer.cancel();
          });
        } else {
          setState(() {
            remainingDuration -= period;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) return widget.builder!(remainingDuration);

    int days = remainingDuration.inDays.remainder(30);
    int hours = remainingDuration.inHours.remainder(24);
    int minutes = remainingDuration.inMinutes.remainder(60);
    int seconds = remainingDuration.inSeconds.remainder(60);

    final state = remainingDuration == Duration.zero
        ? widget.unfinishedState.copyWith(
            style: widget.finishedState?.style,
            leadingStyle: widget.finishedState?.leadingStyle,
            trailingStyle: widget.finishedState?.trailingStyle,
            leadingText: widget.finishedState?.leadingText,
            trailingText: widget.finishedState?.trailingText,
            leading: widget.finishedState?.leading,
            trailing: widget.finishedState?.trailing,
            leadingGap: widget.finishedState?.leadingGap,
            trailingGap: widget.finishedState?.trailingGap,
            format: widget.finishedState?.format,
          )
        : widget.unfinishedState;

    Widget effectiveWidget = Text(
        DateFormat(state.format).format(
          DateTime(0, 0, days, hours, minutes, seconds),
        ).toPersianNumber(),
      style: state.style,
    );
    
    if (state.leadingText != null || state.trailingText != null) {
      effectiveWidget = Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: [
          if (state.leadingText != null || state.leading != null ) ...[
            state.leading ?? Text(state.leadingText!, style: state.leadingStyle),
            if (state.leadingGap > 0) SizedBox(width: state.leadingGap),
          ],
          effectiveWidget,
          if (state.trailingText != null || state.trailing != null) ...[
            if (state.trailingGap > 0) SizedBox(width: state.trailingGap),
            state.trailing ?? Text(state.trailingText!, style: state.trailingStyle),
          ],
        ],
      );
    } else if (widget.alignment != null) {
      effectiveWidget = Align(
        alignment: widget.alignment!,
        child: effectiveWidget,
      );
    }

    return effectiveWidget;
  }
}

class CountDownState {
  final TextStyle? style;
  final TextStyle? leadingStyle;
  final TextStyle? trailingStyle;
  final String format;
  final String? leadingText;
  final String? trailingText;
  final Widget? leading;
  final Widget? trailing;
  final double trailingGap;
  final double leadingGap;

  const CountDownState({
    this.style,
    this.leadingStyle,
    this.trailingStyle,
    this.leadingText,
    this.trailingText,
    this.leading,
    this.trailing,
    this.leadingGap = 0,
    this.trailingGap = 0,
    this.format = 'mm:ss',
  });

  CountDownState copyWith({
    final TextStyle? style,
    final TextStyle? leadingStyle,
    final TextStyle? trailingStyle,
    final String? leadingText,
    final String? trailingText,
    final Widget? leading,
    final Widget? trailing,
    final double? leadingGap,
    final double? trailingGap,
    final String? format,
  }) {
    return CountDownState(
      style: style ?? this.style,
      leadingStyle: leadingStyle ?? this.leadingStyle,
      trailingStyle: trailingStyle ?? this.trailingStyle,
      leadingText: leadingText ?? this.leadingText,
      trailingText: trailingText ?? this.trailingText,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
      leadingGap: leadingGap ?? this.leadingGap,
      trailingGap: trailingGap ?? this.trailingGap,
      format: format ?? this.format,
    );
  }
}

class CountDownController{
  _CountDownState? _state;

  Duration? get remainingDuration => _state?.remainingDuration;

  void start(){
    if(_state == null) return;

    _state!.remainingDuration = _state!.widget.duration;
    _state!._startTimer();
  }

  void resume(){
    _state?._startTimer();
  }

  void stop(){
    _state?._timer?.cancel();
  }
}
