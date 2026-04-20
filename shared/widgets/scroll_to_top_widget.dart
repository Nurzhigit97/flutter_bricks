import 'package:flutter/material.dart';
import 'package:work_up/core/helper/extensions.dart';

class ScrollToTopWidget extends StatelessWidget {
  const ScrollToTopWidget({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: SizedBox(
        width: 35,
        height: 35,
        child: FloatingActionButton(
          backgroundColor: context.colorScheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () => _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          child: Icon(Icons.arrow_upward, color: context.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
