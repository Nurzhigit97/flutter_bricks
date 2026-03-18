import 'package:flutter/material.dart';

class TopSnackBarWidget extends StatefulWidget {
  const TopSnackBarWidget({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.onDismiss,
    super.key,
    this.icon,
    this.iconColor,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onDismiss;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  State<TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _offset = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: widget.iconColor, size: 24),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Text(
                  widget.message,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (widget.actionLabel != null && widget.onAction != null) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    widget.onAction!();
                    widget.onDismiss();
                  },
                  child: Text(
                    widget.actionLabel!,
                    style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
