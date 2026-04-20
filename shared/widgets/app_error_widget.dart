import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  const AppErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(child: Text(error, textAlign: TextAlign.center)),
    );
  }
}
