import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;
  final EdgeInsets? padding;
  final bool softWrap;

  const AppTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
    this.padding,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        decoration: decoration,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );

    if (padding != null) {
      textWidget = Padding(padding: padding!, child: textWidget);
    }

    return textWidget;
  }
}
