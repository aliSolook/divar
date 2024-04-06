import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplittedNumberField extends StatefulWidget {
  const SplittedNumberField({
    super.key,
    required this.count,
    this.size = const Size(74, 48),
    this.style,
    this.controller,
    this.emptyDecoration,
    this.decoration,
    this.duration = const Duration(milliseconds: 200),
    this.direction = TextDirection.ltr,
    this.padding = const EdgeInsets.all(16),
  });
  final int count;
  final TextStyle? style;
  final TextEditingController? controller;
  final BoxDecoration? decoration;
  final BoxDecoration? emptyDecoration;
  final EdgeInsetsGeometry padding;
  final TextDirection direction;
  final Size size;
  final Duration duration;

  @override
  State<SplittedNumberField> createState() => _SplittedNumberFieldState();
}

class _SplittedNumberFieldState extends State<SplittedNumberField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;

  @override
  void initState() {
    _controllers = List.generate(
      widget.count,
      (index) => TextEditingController()
        ..addListener(() {
          setState(() {});
          if (index == 0) return;
          if (_controllers[index].selection.baseOffset == 0 &&
              _controllers[index].selection.extentOffset == 0) {
            _nodes[index - 1].requestFocus();
          }
        }),
    );
    _nodes = List.generate(
        widget.count,
        (index) => FocusNode()
          ..addListener(() {
            if (index < widget.count - 1 &&
                _controllers[index + 1].text.isNotEmpty) {
              _nodes[index + 1].requestFocus();
            }

            if (index > 0 && _controllers[index].text.isEmpty) {
              _nodes[index - 1].requestFocus();
            }
          }));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    assert(widget.count == _controllers.length);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        widget.count,
        (index) => _fieldBuilder(index),
      ),
    );

    if (widget.style != null) {
      child = DefaultTextStyle(style: widget.style!, child: child);
    }

    return Directionality(
      textDirection: widget.direction,
      child: child,
    );
  }

  Widget _fieldBuilder(int index) {
    return GestureDetector(
      onTap: () {
        _nodes[index].requestFocus();
      },
      child: TweenAnimationBuilder(
        duration: widget.duration,
        tween: Tween<double>(
            begin: _controllers[index].text.isEmpty ? 0 : 1,
            end: _controllers[index].text.isEmpty ? 1 : 0),
        builder: (context, value, child) {
          return DecoratedBox(
            decoration: (widget.emptyDecoration == null
                    ? widget.decoration
                    : BoxDecoration.lerp(
                        widget.decoration, widget.emptyDecoration, value)) ??
                const BoxDecoration(),
            child: child,
          );
        },
        child: SizedBox.fromSize(
          size: widget.size,
          child: Center(
            child: TextField(
              style: widget.style,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hoverColor: Colors.transparent,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.transparent,
                filled: true,
              ),
              enableInteractiveSelection: false,
              textAlign: TextAlign.center,
              inputFormatters: [
                TextInputFormatter.withFunction(
                  (oldValue, newValue) =>
                      _formatterHandler(oldValue, newValue, index),
                ),
              ],
              focusNode: _nodes[index],
              controller: _controllers[index],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingValue _formatterHandler(
      TextEditingValue oldValue, TextEditingValue newValue, int index) {
    String value = newValue.text
        .replaceAll(
            RegExp(r'[^0-9۰-۹]+'), '') // removes everything but the numbers
        .toPersianNumber();

    if (oldValue.text.length > newValue.text.length) {
      if (index != 0) _nodes[index - 1].requestFocus();
      return newValue;
    }

    return _setTexts(value, index);
  }

  TextEditingValue _setTexts(String value, int index) {
    if (value.isEmpty) return const TextEditingValue(text: '');
    final length = value.length > widget.count - index
        ? widget.count - index
        : value.length;

    for (var i = 1; i < length; i++) {
      _controllers[i + index].value = TextEditingValue(
        text: value[i],
        selection: const TextSelection.collapsed(offset: 1),
      );
    }

    _nodes[length + index - 1].requestFocus();

    return TextEditingValue(
      text: value[0],
      selection: const TextSelection.collapsed(offset: 1),
    );
  }
}

extension StringExtension on String {
  String? at(int index) {
    if (length - 1 < index) return null;
    return this[index];
  }
}
