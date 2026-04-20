import 'package:work_up/core/utils/constants/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.icon.icon.image(width: 38, height: 32);
  }
}
