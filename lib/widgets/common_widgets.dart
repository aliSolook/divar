import 'package:flutter/material.dart';

import '../constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, this.image});

  final String title;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontFamily: DefaultFonts.bold,
      fontSize: 16,
      color: DefaultColors.veryDarkGrey,
    );

    if (image == null) {
      return Text(
        title,
        style: style,
      );
    }

    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Image(
                width: 24,
                image: image!,
              ),
            ),
          ),
          TextSpan(
            text: title,
          )
        ],
        style: style,
      ),
    );
  }
}

class ClickItem extends StatelessWidget {
  const ClickItem({
    super.key,
    required this.title,
    this.onTap,
    this.image,
    this.style,
    this.trailingImage =
        const AssetImage('assets/images/arrow_left_red_icon.png'),
    this.imageWidth = 24,
    this.trailingImageWidth = 24,
  });

  final String title;
  final ImageProvider? image;
  final ImageProvider trailingImage;
  final double? imageWidth;
  final double? trailingImageWidth;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Ink(
        decoration: const BoxDecoration(
          color: DefaultColors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: DefaultColors.mediumLightGrey,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              end: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: [
              SizedBox(width: image == null ? 16 : 8),
              if (image != null) ...[
                Image(
                  width: imageWidth,
                  image: image!,
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Text(
                  title,
                  style: style ?? const TextStyle(
                    fontFamily: DefaultFonts.regular,
                    fontSize: 16,
                    color: DefaultColors.veryDarkGrey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Tooltip(
                message: title,
                child: Image(
                  width: 24,
                  image: trailingImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchItem extends StatefulWidget {
  const SwitchItem({
    super.key,
    required this.title,
    required this.value,
    this.style,
    this.onChanged,
  });

  final String title;
  final bool value;
  final TextStyle? style;
  final void Function(bool value)? onChanged;

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged == null
          ? null
          : () => widget.onChanged!(!widget.value),
      child: Ink(
        decoration: const BoxDecoration(
          color: DefaultColors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: DefaultColors.mediumLightGrey,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: widget.style ?? TextStyle(
                      fontFamily: DefaultFonts.regular,
                      fontSize: 16,
                      color: widget.onChanged != null
                          ? DefaultColors.veryDarkGrey
                          : DefaultColors.darkGrey,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Tooltip(
                message: widget.title,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    height: 22,
                    child: FittedBox(
                      child: Theme(
                        data: Theme.of(context).copyWith(useMaterial3: true),
                        child: Switch(
                          value: widget.value,
                          onChanged: widget.onChanged,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
