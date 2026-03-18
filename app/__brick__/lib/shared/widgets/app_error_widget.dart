import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  const AppErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
