import 'package:flutter/material.dart';

class AppErrorNetworkImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData? icon;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  const AppErrorNetworkImageWidget({
    super.key,
    this.height,
    this.width,
    this.icon,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.error, size: 24);
  }
}
