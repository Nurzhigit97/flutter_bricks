import 'package:flutter/material.dart';

class AppPagePaddingBottomWidget extends StatelessWidget {
  const AppPagePaddingBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).padding.bottom + 80);
  }
}
