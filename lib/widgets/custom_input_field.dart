import 'dart:math';
import 'package:divar/constants.dart';
import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomField<T> extends StatefulWidget {
  const CustomField({
    super.key,
    this.hint,
    this.titleText,
    this.titleStyle,
    this.title,
    this.titleAlignment = AlignmentDirectional.topStart,
    this.titleGap = 16,
    this.min,
    this.style,
    this.max,
    this.lineCount,
    this.type = CustomFieldType.number,
    this.hintText,
    this.hintStyle,
    this.enabled = true,
    this.controller,
    this.initialValue,
    this.textAlign = TextAlign.right,
    this.items = const [],
    this.onSelected,
    this.selectedValue,
    this.focusNode,
    this.enableFilter = false,
    this.incrementCount = 1,
    this.enableSearch = true,
  });

  const CustomField.text({
    super.key,
    this.titleText,
    this.focusNode,
    this.titleStyle,
    this.style,
    this.title,
    this.titleGap = 16,
    this.titleAlignment = AlignmentDirectional.topStart,
    this.enabled = true,
    this.hintText,
    this.hintStyle,
    this.min,
    this.max,
    this.controller,
    this.initialValue,
    this.textAlign = TextAlign.start,
  })  : lineCount = null,
        type = CustomFieldType.text,
        onSelected = null,
        enableFilter = false,
        items = const [],
        selectedValue = null,
        hint = null,
        incrementCount = 0,
        enableSearch = false;

  const CustomField.number({
    super.key,
    this.titleText,
    this.titleStyle,
    this.style,
    this.title,
    this.focusNode,
    this.titleGap = 16,
    this.titleAlignment = AlignmentDirectional.topStart,
    this.enabled = true,
    this.hintText,
    this.hintStyle,
    this.min = 0,
    this.max,
    this.controller,
    this.initialValue,
    this.textAlign = TextAlign.end,
    this.incrementCount = 1,
  })  : lineCount = null,
        type = CustomFieldType.number,
        onSelected = null,
        enableFilter = false,
        items = const [],
        selectedValue = null,
        hint = null,
        enableSearch = false;

  const CustomField.longText({
    super.key,
    this.titleText,
    this.titleStyle,
    this.style,
    this.title,
    this.titleGap = 16,
    this.titleAlignment = AlignmentDirectional.topStart,
    this.enabled = true,
    this.hintText,
    this.hintStyle,
    this.focusNode,
    this.min = 4,
    this.max,
    this.controller,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.lineCount,
  })  : type = CustomFieldType.longText,
        onSelected = null,
        enableFilter = false,
        items = const [],
        selectedValue = null,
        incrementCount = 0,
        hint = null,
        enableSearch = false;

  const CustomField.dropDown({
    super.key,
    required this.items,
    this.focusNode,
    this.onSelected,
    this.style,
    this.hint,
    this.titleText,
    this.titleStyle,
    this.title,
    this.titleGap = 16,
    this.titleAlignment = AlignmentDirectional.topStart,
    this.enabled = true,
    this.hintText,
    this.hintStyle,
    this.selectedValue,
    this.enableFilter = false,
    this.enableSearch = true,
    // this.width,
  })  : min = null,
        max = null,
        incrementCount = 0,
        lineCount = null,
        type = CustomFieldType.dropDown,
        controller = null,
        textAlign = TextAlign.center,
        initialValue = null;

  final String? titleText;
  final TextStyle? titleStyle;
  final Widget? title;
  final double titleGap;
  final AlignmentGeometry titleAlignment;
  final int? min;
  final int? max;
  final int? lineCount;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? hint;
  final bool enabled;
  final CustomFieldType type;
  final TextEditingController? controller;
  final String? initialValue;
  final TextAlign textAlign;
  final List<DropdownMenuItem<T>> items;
  final bool enableFilter;
  final bool enableSearch;
  final T? selectedValue;
  final int incrementCount;
  final FocusNode? focusNode;
  final void Function(T? value)? onSelected;

  @override
  State<CustomField<T>> createState() => _CustomFieldState<T>();
}

class _CustomFieldState<T> extends State<CustomField<T>> {
  late T? dropDownSelectedValue = widget.selectedValue;
  late final TextEditingController _controller;
  late final _node = widget.focusNode ?? FocusNode();
  late final bool _isControllerLocal;
  String? _error;

  @override
  void initState() {
    _isControllerLocal = widget.controller == null;
    _controller = widget.controller ??
        TextEditingController(
          text: widget.type != CustomFieldType.number
              ? widget.initialValue?.toPersianNumber()
              : widget.initialValue
                  ?.replaceAll(RegExp(r'[^0-9۰-۹]+'), '')
                  .toPersianNumber(),
        );

    _node.addListener(() {
      if (_node.hasFocus) {
        _controller.selection = TextSelection(
            baseOffset: _controller.text.length,
            extentOffset: _controller.text.length);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if (_isControllerLocal) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget effectiveChild;

    if (widget.type == CustomFieldType.dropDown) {
      effectiveChild = DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(
            BorderSide(color: DefaultColors.mediumLightGrey, width: 1),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownButton<T>(
          focusNode: _node,
          elevation: 0,
          focusColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
          style: widget.style ??
              const TextStyle(
                fontFamily: DefaultFonts.regular,
                fontSize: 16,
                color: DefaultColors.veryDarkGrey,
              ),
          icon: Expanded(
            // width: double.infinity,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Transform.rotate(
                angle: pi / 2,
                child: const Image(
                  width: 24,
                  image: AssetImage('assets/images/arrow_right_icon.png'),
                ),
              ),
            ),
          ),
          underline: const SizedBox(),
          value: widget.selectedValue,
          items: widget.items,
          onChanged: widget.enabled ? _dropdownOnChanged : null,
          hint: widget.hint,
        ),
      );
    } else {
      effectiveChild = TextField(
        inputFormatters: widget.type != CustomFieldType.number
            ? null
            : [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  String value = newValue.text
                      .replaceAll(RegExp(r'[^0-9۰-۹]+'),
                          '') // removes everything but the numbers
                      .toPersianNumber();

                  if (newValue.text == value) return newValue;

                  final regex = RegExp(r'[^0-9۰-۹]');

                  final selection = newValue.selection;

                  var base = selection.baseOffset;
                  var extent = selection.extentOffset;

                  base -=
                      regex.allMatches(newValue.text.substring(0, base)).length;
                  extent -= regex
                      .allMatches(newValue.text.substring(0, extent))
                      .length;

                  if (base < 0) base = 0;
                  if (extent < 0) extent = 0;

                  base = base > value.length ? value.length : base;

                  extent = extent > value.length ? value.length : extent;

                  return TextEditingValue(
                    text: value,
                    selection: TextSelection(
                      baseOffset: base,
                      extentOffset: extent,
                    ),
                  );
                }),
              ],
        focusNode: _node,
        textDirection:
            widget.type == CustomFieldType.number ? TextDirection.ltr : null,
        textAlign: widget.textAlign,
        controller: _controller,
        keyboardType: widget.type == CustomFieldType.number
            ? TextInputType.number
            : TextInputType.text,
        minLines: widget.type == CustomFieldType.longText ? widget.min : null,
        maxLines: widget.type == CustomFieldType.longText ? widget.max : null,
        maxLength: widget.type == CustomFieldType.text ? widget.max : null,
        cursorColor: DefaultColors.red,
        decoration: InputDecoration(
          errorMaxLines: 1,
          errorText: _error,
          errorStyle: const TextStyle(
            fontFamily: DefaultFonts.light,
            fontSize: 14,
            color: DefaultColors.red,
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          hintTextDirection: TextDirection.rtl,
          enabled: widget.enabled,
          suffixIcon: _suffix(context: context),
        ),
        style: widget.style ??
            const TextStyle(
              fontFamily: DefaultFonts.regular,
              fontSize: 16,
              color: DefaultColors.veryDarkGrey,
            ),
      );
    }
    if (widget.title != null || widget.titleText != null) {
      effectiveChild = Column(
        children: [
          Align(
            alignment: widget.titleAlignment,
            child: widget.title ??
                Text(
                  widget.titleText!,
                  style: widget.titleStyle ??
                      const TextStyle(
                          fontFamily: DefaultFonts.regular,
                          fontSize: 14,
                          color: DefaultColors.darkGrey),
                ),
          ),
          SizedBox(height: widget.titleGap),
          effectiveChild,
        ],
      );
    }

    return effectiveChild;
  }

  Widget? _suffix({required BuildContext context}) {
    if (widget.type == CustomFieldType.number) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(9999),
          ),
          onTap: _onTap(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.flip(
                flipY: true,
                child: const Image(
                  width: 6,
                  height: 6,
                  image: AssetImage('assets/images/red_polygon.png'),
                ),
              ),
              const SizedBox(height: 8),
              const Image(
                width: 6,
                image: AssetImage('assets/images/red_polygon.png'),
              ),
            ],
          ),
        ),
      );
    }

    return null;
  }

  void _dropdownOnChanged(T? value) {
    if (value == this.dropDownSelectedValue) return;

    setState(() {
      dropDownSelectedValue = value;
    });

    if (widget.onSelected == null) return;

    widget.onSelected!(value);
  }

  void Function()? _onTap(BuildContext context) {
    if (widget.type == CustomFieldType.number) {
      return () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                final int value;
                final parsed = int.tryParse(_controller.text.toRegularNumber());
                if (parsed != null) {
                  value = parsed < widget.incrementCount
                      ? widget.incrementCount
                      : parsed;
                } else if (widget.min != null) {
                  value = widget.min! < widget.incrementCount
                      ? widget.incrementCount
                      : widget.min!;
                } else {
                  value = 0;
                }

                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  contentPadding: EdgeInsets.zero,
                  // elevation: 0,
                  content: SizedBox.square(
                    dimension: 300,
                    child: Center(
                      child: NumberPicker(
                        step: widget.incrementCount,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: DefaultColors.lightGrey,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                        ),
                        itemHeight: 100,
                        axis: Axis.horizontal,
                        minValue: widget.min == null
                            ? -999999
                            : widget.min! < widget.incrementCount
                                ? widget.incrementCount
                                : widget.min!,
                        maxValue: widget.max == null ? 999999 : widget.max! + 1,
                        textMapper: (numberText) =>
                            numberText.toPersianNumber(),
                        value: value,
                        textStyle: const TextStyle(
                          fontFamily: DefaultFonts.regular,
                          color: DefaultColors.grey,
                          fontSize: 18,
                        ),
                        selectedTextStyle: const TextStyle(
                          fontFamily: DefaultFonts.regular,
                          color: DefaultColors.red,
                          fontSize: 24,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _controller.text =
                                value.toString().toPersianNumber();
                          });
                        },
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        backgroundColor: Colors.transparent,
                        foregroundColor: DefaultColors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        textStyle: const TextStyle(
                          fontFamily: DefaultFonts.regular,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          _controller.text = value.toString().toPersianNumber();
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('انتخاب'),
                    )
                  ],
                );
              },
            );
            // return AboutDialog();
          },
        );
      };
    }

    return null;
  }
}

enum CustomFieldType {
  number,
  text,
  longText,
  dropDown,
}
