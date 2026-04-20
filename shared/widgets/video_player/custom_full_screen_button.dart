// ===================================================================
// custom_full_screen_button.dart
import 'package:flutter/material.dart';

class CustomFullScreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isFullScreen;

  const CustomFullScreenButton({
    super.key,
    required this.onPressed,
    this.isFullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
        color: Colors.white,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
